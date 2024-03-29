function checkCashRegister(price, cash, cid) {
  const currencyUnits = { PENNY: 0.01, NICKEL: 0.05, DIME: 0.1, QUARTER: 0.25, ONE: 1, FIVE: 5, TEN: 10, TWENTY: 20, 'ONE HUNDRED': 100 };

  function moneyInRegister(unitsArray) {
    let total = 0;
    for (const [name, amount] of unitsArray) {
      total += amount;
    }
    return total;
  }
  let change = [];
  let to_ret = {
    status: null,
    change: change
  }
  let mony_left = false
  // console.log(to_ret)
  let accumulated = 0 // floating point sucks
  let remainingChange = Math.round((cash - price) * 100); // Convert to cents for precision
  for (let i = cid.length - 1; i >= 0; i--) {
    let unit = cid[i][0];
    let unitValueInCents = Math.floor(currencyUnits[unit] * 100);
    let availableInCents = Math.round(cid[i][1] * 100); // Convert to cents for precision
    let maxUnits = Math.floor(availableInCents / unitValueInCents);
    let selectedUnits = Math.min(maxUnits, Math.floor(remainingChange / unitValueInCents));
    let selectedAmount = selectedUnits * unitValueInCents;
    remainingChange -= selectedAmount;

    if (selectedAmount > 0) {
      change.push([unit, selectedAmount / 100]); // Convert back to dollars
    }
  }

  if (remainingChange > 0) {
    to_ret["status"] = "INSUFFICIENT_FUNDS"
    to_ret["change"] = []
  }
  else if (moneyInRegister(cid) == cash - price) {
    to_ret.status = "CLOSED"
    to_ret.change = cid
  } else {
    to_ret.status = "OPEN"
  }
  // console.log(to_ret)

  return to_ret;

}

checkCashRegister(19.5, 20, [["PENNY", 0.5], ["NICKEL", 0], ["DIME", 0], ["QUARTER", 0], ["ONE", 0], ["FIVE", 0], ["TEN", 0], ["TWENTY", 0], ["ONE HUNDRED", 0]]);