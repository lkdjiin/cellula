automaton "Test CA" do
  dimensions 1
  type      :elementary
  width     40
  rule      :wolfram_code_2
end

study "Test CA" do
  method      :random
  generations 20
end
