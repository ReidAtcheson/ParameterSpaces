include("../ParameterSpaces.jl");

using ParameterSpaces






function test_iterate()
  p=ParameterSpace([1,0],[1,0],[1,0]);
  s=[Any[1,1,1];Any[1,1,0];Any[1,0,1];Any[1,0,0];
  Any[0,1,1];
  Any[0,1,0];
  Any[0,0,1];
  Any[0,0,0]];


  ss=Array[];
  for pm in p
    ss=[ss;pm];
  end

  @assert norm(s-ss)==0
end


function test_sample()
  p=ParameterSpace([1,0],[1,0],[1,0]);

  for i=1:10
    r=sample(p);
  end

  #not really sure how to test a random sampling..
  @assert true;
end



test_iterate();
test_sample();
