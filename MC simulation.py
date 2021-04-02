import random
import numpy as np
import scipy.stats as st

#MC sim
counter = 0
chi_sq_values = []
# want 10,000 simulations
while counter < 10000:
    # will eventually mimic your real six orders of size
    sim_orders = [0, 0, 0, 0, 0, 0]
    # generating 20 random numbers
    for i in range(20):
        numbers = random.random()
        if numbers <= 1 / 6:
            sim_orders[0] += 1
        elif numbers <= 2 / 6:
            sim_orders[1] += 1
        elif numbers <= 3 / 6:
            sim_orders[2] += 1
        elif numbers <= 4 / 6:
            sim_orders[3] += 1
        elif numbers <= 5 / 6:
            sim_orders[4] += 1
        else:
            sim_orders[5] += 1
    observed = np.array(sim_orders)
    expected = np.array([20 / 6, 20 / 6, 20 / 6, 20 / 6, 20 / 6, 20 / 6])
    chisq = st.chisquare(observed, expected)
    chisq_value = chisq[0]
    chi_sq_values.append(chisq[0])
    counter += 1

greater = [i for i in chi_sq_values if i >= 1.6]
total = len(greater)

p = total/10000
print(p)

#Chisq for original data set
observed = np.array([5, 4, 3, 3, 3, 2])
expected = np.array([20/6, 20/6, 20/6, 20/6, 20/6, 20/6])
chisq_orig = st.chisquare(observed, expected)

print (chisq_orig[0]) #Gives chisq value to use
print (chisq_orig[1]) #Gives p-value


