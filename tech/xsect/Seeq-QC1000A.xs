# Prepare input layers
mn1 = layer("34/0")
in1 = layer("32/0").inverted
m0 = layer("30/0").inverted
I0 = layer("31/0").inverted
I1 = layer("3/0")
I1i = layer("3/0").inverted
I2 = layer("8/0").inverted
m1 = layer("1/0")
m2 = layer("6/0")
m3 = layer("8/0")
J1 = layer("4/0")
A1 = layer("5/0")
A1i = layer("5/0").inverted
R2 = layer("9/0")
R3 = layer("11/0")
Cu = layer("12/0")
In = layer("15/0")


# "grow" metal on mask m1 with thickness 0.3 and lateral extension 0.1
# with elliptical edge contours
mMn1= mask(mn1).grow(0.04, 0.01, :mode => :round)
Din1 = mask(in1).grow(0.075, 0.02, :mode => :round)
metal0 = mask(m0).grow(0.2, 0.05, :mode => :round)
Di0 = mask(I0).grow(0.15, 0.05, :mode => :round)
Di0p = planarize(:downto=>metal0, :into=>Di0)
Di0 = mask(I0).grow(0.15, 0.05, :mode => :round)

metal1 = mask(m1).grow(0.135, 0.05, :mode => :round)

mask(A1).etch(0.01, -0.01, :mode => :round, :into => metal1)
mA1 = mask(A1).grow(0.04, -0.001, :mode => :round)


mask(A1i).etch(0.01, -0.01, :mode => :round, :into =>metal1)

#mask(J1).etch(0.06, 0.1, :mode => :round, :into => mA1)

mJ1 = mask(J1).grow(0.04, 0.01, :mode => :round, :into => [mA1, metal1])

Di11a = mask(I1i.or(R2)).grow(0.1)

mR2 = mask(R2).grow(0.05)

Di11 = mask(I1i).grow(0.1, 0.01, :mode => :round)

metal2 = mask(m2).grow(0.3, 0.1, :mode => :round)
Dil3 = mask(I2).grow(0.5, 0.1, :mode => :round)
metal3 = mask(m3).grow(0.6, 0.1, :mode => :round)
metal4 = mask(R3).grow(0.3, 0.1, :mode => :round)
metal5 = mask(Cu).grow(0.6, 0.2, :mode => :round)
metal6 = mask(In).grow(0.6, 0.2, :mode => :round)

# output the material data to the target layout
output("0/0", bulk)
output("34/0", mMn1)
output("32/0", Din1)
output("30/0", metal0)
output("31/0", Di0)
output("1/0", metal1)
output("4/0", mJ1)
output("5/0", mA1)

output("9/0", mR2)

output("3/0", Di11.or(Di11a))

output("6/0", metal2)
output("10/0", metal3)
output("8/0", Dil3)
output("11/0", metal4)
output("12/0", metal5)
output("15/0", metal6)
