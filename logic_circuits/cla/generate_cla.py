ci_lines = [
    "c_in"
]

print("Type number of bits to support")
n_bits =int(input())

f = open("cla_template.txt", "r")
template = f.read()
template = template.replace("{bit_size}", str(n_bits - 1))

ci_list = ""
spacing = "    "

for i in range(1, n_bits + 1):
    new_and = f"(a[{i - 1}] & b[{i - 1}])"
    new_xor = f"(a[{i - 1}] ^ b[{i - 1}])"
    new_ci = "{} | ({} & ({}))".format(new_and, new_xor, ci_lines[i - 1])
    
    ci_lines.append(new_ci)
    
    
for i in range(len(ci_lines) - 1):
    if i != 0:
        ci_list += spacing
    ci_list += "assign ci[{}] = {};".format(i, ci_lines[i]) + '\n'
    
ci_list += spacing
ci_list += "assign c_out = {};".format(ci_lines[-1]) + '\n'

template = template.replace("{ci_list}", str(ci_list))

f = open("cla.v", "w")
f.write(template)
f.close()
