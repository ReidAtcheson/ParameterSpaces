module ParameterSpaces



export ParameterSpace,sample

type ParameterSpace
  params::Array{Array{Any}};
end


function ParameterSpace(xs...)
  params=Array[];
  for x in xs
    push!(params,x);
  end
  n=length(params);
  return ParameterSpace(params);
end


function Base.start(p::ParameterSpace)
  o=Array{Int}(ones(length(p.params)+1));
  o[1]=1;
  return o;
end

function Base.done(p::ParameterSpace,s)
  return s[1]==2;
end


function Base.next(p::ParameterSpace,s)
  np   =map(z->z[2][z[1]],zip(s[2:end],p.params));
  es   =[2;map(length,p.params)];
  ns   =next_lexicographic(es,s); 
  return (np,ns);
end


function next_lexicographic(maxes,_s)
  s=copy(_s);
  n=length(s);
  if n==0
    return s;
  end

  if s[n]==maxes[n]
    return [next_lexicographic(maxes[1:end-1],s[1:end-1]);1]
  else
    s[n]=s[n]+1;
    return s;
  end
end

function sample(p::ParameterSpace)
  r=[];
  for x in p.params
    push!(r,rand(x));
  end
  return r;
end



end
