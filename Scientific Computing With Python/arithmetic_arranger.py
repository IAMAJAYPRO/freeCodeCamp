def arithmetic_arranger(problems, sol=False):
    # validator start
    if len(problems) > 5:
        return ("Error: Too many problems.")
    sep = [pro.split() for pro in problems]
    for i in sep:
        if i[1] not in "+-":
            return ("Error: Operator must be '+' or '-'.")

    le = max_lengths = []

    for pro in sep:
        max_length = 0
        for dig in pro[::2]:
            if not dig.isnumeric():
                return ("Error: Numbers must only contain digits.")
            elif len(dig) > 4:
                return ("Error: Numbers cannot be more than four digits.")
            max_length = max(max_length, len(dig))
        max_lengths.append(max_length)
    # vaidator end
    pattern = ""
    for i in range(len(sep)):
        pattern += sep[i][0].rjust(max_lengths[i] + 2)
        pattern += 4 * " "

    pattern = pattern.rstrip()
    pattern += "\n"
    for i in range(len(sep)):
        pattern += sep[i][1] + " " + sep[i][2].rjust(max_lengths[i])
        pattern += 4 * " "

    pattern = pattern.rstrip()
    pattern += "\n"
    for i in range(len(sep)):
        pattern += "-" * (max_lengths[i] + 2)
        pattern += 4 * " "

    pattern = pattern.rstrip()
    if sol:
        pattern += "\n"
        for i in range(len(sep)):
            pattern += str(eval("".join(sep[i]))).rjust(max_lengths[i] + 2)
            pattern += 4 * " "

        pattern = pattern.rstrip()

    arranged_problems = pattern
    return arranged_problems
