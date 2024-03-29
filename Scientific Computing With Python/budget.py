def obj_to_str(obj):
    left = obj["description"].ljust(23)[:23]
    right = f"{obj['amount']:.2f}".rjust(7)[-7:]
    return left + right


class Category:

    def __init__(self, name) -> None:
        self.ledger = []
        self.name = name

    def get_balance(self):
        balance = sum(x["amount"] for x in self.ledger)
        return balance

    def check_funds(self, amount):
        balance = self.get_balance()
        return balance >= amount

    def deposit(self, amount, description=""):
        entry = {"amount": amount, "description": description}
        self.ledger.append(entry)

    def withdraw(self, amount, description=""):
        if self.check_funds(amount):
            self.deposit(-amount, description)
            return True
        else:
            return False

    #from self to other
    def transfer(self, amount, other):
        if self.check_funds(amount):
            self.withdraw(amount, "Transfer to " + other.name)
            other.deposit(amount, "Transfer from " + self.name)
            return True
        else:
            return False

    def __str__(self):
        account = self.name.center(30, '*') + "\n"

        for entry in self.ledger:
            account += obj_to_str(entry)
            account += "\n"
        account += f"Total: {self.get_balance():.2f}"
        return account


def create_spend_chart(categories):
    names = [x.name for x in categories]
    balances = [
        sum([x["amount"] for x in cat.ledger if x["amount"] < 0])
        for cat in categories
    ]
    total = sum(balances)
    percentage = [x * 10 / total for x in balances]
    chart = "Percentage spent by category"
    for i in range(10, -1, -1):
        chart += "\n"
        chart += f'{str(i*10).rjust(3)}| {"o" if i<=percentage[0] else " "}  {"o" if i<=percentage[1] else " "}  {"o" if i<=percentage[2] else " "}  '
    chart += "\n"
    chart += "    ----------"
    max_len = max([len(x) for x in names])
    for i in range(max_len):
        chart += "\n"
        chart += f'     {names[0][i] if i<len(names[0]) else " "}  {names[1][i] if i<len(names[1]) else " "}  {names[2][i] if i<len(names[2]) else " "}  '
    return chart
