# work with John on an optimal action path
[:allocate, :ready, :converge, :allocate, :ready, :converge, :destroy].each { |action_name|
  machine 'cycle-actions' do
    action action_name
    recipe 'mysql'
  end
}
