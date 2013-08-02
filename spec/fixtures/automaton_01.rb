automaton "Test CA" do
  dimensions 1
  type      :elementary
  width     20
  rules     :wolfram_code_110
end

study "Test CA" do
  method      :random
  generations 6
end
