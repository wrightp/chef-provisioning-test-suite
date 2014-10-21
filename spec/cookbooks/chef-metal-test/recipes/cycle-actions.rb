[:allocate, :ready, :converge, :allocate, :ready, :converge, :destroy].each { |action_name|
  machine 'cycle-actions' do
    action action_name
  end
}
