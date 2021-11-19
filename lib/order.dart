const orderRules = <int, String>{
  1: 'Units of equal strength trying to occupy the same province cause all those units to remain in their original provinces',
  2: 'A standoff doesn’t dislodge a unit already in the province where the standoff took place',
  3: 'One unit not moving can stop a unit or series of units from moving',
  4: 'Units can’t trade places without the use of a convoy',
  5: 'Three or more units can rotate provinces during a turn provided none directly trade places',
  6: 'A unit not ordered to move can be supported by a support order that only mentions its province',
  7: 'A unit ordered to move can only be supported by a support order that matches the move the unit is trying to make',
  8: 'A dislodged unit can still cause a standoff in a province different from the one that dislodged it',
  9: 'A dislodged unit, even with support, has no effect on the province that dislodged it',
  10: 'Support is cut if the unit giving support is attacked from any province except the one where support is being given',
  11: 'Support is cut if the unit giving support is dislodged',
  12: 'A unit being dislodged by one province can still cut support in another province',
  13: 'Dislodgment of a fleet in a convoy causes the convoy to fail',
  14: 'A convoy that causes the convoyed Army to standoff at its destination results in that army remaining in its original province',
  15: 'A country can’t dislodge or support the dislodgment of one of its own units, even if that dislodgment is unexpected',
  16: 'An attack by a country on one of its own units doesn’t cut support',
  17: 'Two units can exchange places if either or both are convoyed',
  18: 'An Army convoyed using alternate convoy orders reaches its destination as long as at least one convoy route remains open',
  19: 'A convoyed Army doesn’t cut the support of a unit supporting an attack against one of the Fleets necessary for the Army to convoy',
  20: 'An Army with at least one successful convoy route will cut the support given by a unit in the destination province that is trying to support an attack on a Fleet in an alternate route of that convoy'
}

class Order {}
