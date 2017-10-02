class Container < (rand < 0.5 ? Array : Hash)
end

p Container.superclass