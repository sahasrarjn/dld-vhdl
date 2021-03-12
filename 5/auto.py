# for i in range(2,8):
# 	print("\tcargen2{} : carryGen\n\tport map(g1({}),p1({}),g1({}),p1({}),g2({}),p2({}));".format(i-2,i-2,i-2,i,i,i,i))


# for i in range(8):
# 	print("\tnot{} : TwoByOneMux\n\tport map(def(0),def(1),carry({}),carryc({}))".format(i,i,i))


for i in range(1,8):
	print("\txor{} : TwoByOneMux\n\tport map(carry({}), carryc({}), p_0({}), sum({}));".format(i,i-1,i-1,i,i))