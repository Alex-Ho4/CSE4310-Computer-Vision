function result = chi_squared(sc1, sc2)

chi = (sc1 - sc2);
chi = chi .^ 2;
chi = chi ./ (sc1 + sc2);
chi = sum(chi(:));
chi = chi / 2;

result = chi;

end

