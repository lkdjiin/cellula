automaton "Test CA" do
  dimensions 1
  type      :elementary
  width     80
  rule      :wolfram_code_110
end

study "Test CA" do
  method      :random
  generations 40
end
