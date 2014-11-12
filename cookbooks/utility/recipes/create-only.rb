machine_batch do
  1.upto(4) do |i|
    machine "create-#{i}"
  end
end
