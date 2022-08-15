require 'redis'

class SecretSanta
  def initialize(file)
    @file = file
    @redis = Redis.new
    @names_list = nil
    @to_be_picked_list = nil
  end

  def run
    raw_csv = read_csv(@file)
    @names_list = csv_to_array(raw_csv)
    @to_be_picked_list = @names_list.dup
    result = generate_santa_list
    save_to_csv(result)
  end

  def read_csv(file)
    File.read(file)
  end

  def csv_to_array(raw_csv)
    raw_csv.split("\n")[1..-1].map { |row| row }
  end

  def generate_santa_list
    final_list = []
    errors = 0

    @names_list.each_with_index do |current_person, index|
      picked_person = @to_be_picked_list.sample

      while picked_person == current_person ||
            picked_in_last_three_years?(current_person, picked_person)
        puts "[WHILE] #{current_person} -> #{picked_person}"
        picked_person = @to_be_picked_list.sample
        errors += 1
        if errors > 25
          puts 'Please try again'
          exit 1
        end
      end

      @to_be_picked_list.delete(picked_person)
      puts "#{current_person} -> #{picked_person}"
      final_list << [current_person, picked_person]
    end

    final_list.each do |name1, name2|
      store_picks(name1, name2)
    end

    final_list
  end

  def save_to_csv(list)
    csv = "name1,name2\n"
    list.each do |row|
      csv << "#{row.join(',')}\n"
    end

    File.write("#{@file[0..-5]}_result.csv", csv)
  end

  def picked_in_last_three_years?(name1, name2)
    old_picks = @redis.get(name1)
    return false if old_picks.nil?

    old_picks.split(',').each do |pick|
      return true if name2 == pick
    end

    false
  end

  def store_picks(name1, name2)
    old_picks = @redis.get(name1)
    if !old_picks.nil? && old_picks.split(',').size >= 2
      remove_pick(name1)
      old_picks = @redis.get(name1)
    end
    value_to_store = old_picks.nil? ? name2 : "#{old_picks},#{name2}"
    # puts "#{name1} picked #{value_to_store}"
    @redis.set(name1, value_to_store)
  end

  def remove_pick(name1)
    old_picks = @redis.get(name1)
    puts "Removing oldest pick of #{old_picks} from #{name1}"
    @redis.set(name1, old_picks.split(',')[1..-1].join(','))
  end
end

SecretSanta.new('./list2.csv').run
