shared_examples_for "a list-only command" do
  it "raises an error for non-list values" do
    key = 'mock-redis-test:list-only'

    method = method_from_description
    args = args_for_method(method).unshift(key)

    @redises.set(key, 1)
    lambda do
      @redises.send(method, *args)
    end.should raise_error(RuntimeError)
  end
end
