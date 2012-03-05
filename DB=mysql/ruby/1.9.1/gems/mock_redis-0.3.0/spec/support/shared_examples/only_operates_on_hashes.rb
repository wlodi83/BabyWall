shared_examples_for "a hash-only command" do
  it "raises an error for non-hash values" do
    key = 'mock-redis-test:hash-only'

    method = method_from_description
    args = args_for_method(method).unshift(key)

    @redises.set(key, 1)
    lambda do
      @redises.send(method, *args)
    end.should raise_error(RuntimeError)
  end
end
