# actually need to assert the state after the initial allocate, ready, converge sequence
[:allocate, :ready, :converge, :allocate, :ready, :converge, :destroy].each { |action_name|
  machine 'cycle-actions' do
    action action_name
  end
}
