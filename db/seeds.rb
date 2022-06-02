table_names = %w(staff_members administrators staff_events)

table_names.each do |table_name|
  path = Rails.root.join("db", "seeds", Rails.env, "#{table_name}.rb")
  p path
  if File.exist?(path)
    puts "Creating #{table_name}...."
    require(path)
  end
end