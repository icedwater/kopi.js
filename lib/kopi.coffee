class Kopi

  parse: (name)->
    kopi_content = 
        water: 1
        coffee: 1
        sugar: 1
        condensed_milk: 1
        evaporated_milk: 0

    parse_name = name.trim().toLowerCase()

    if parse_name == 'kopi o'
        kopi_content.condensed_milk = 0
    else if parse_name == 'kopi o gau'
        kopi_content.coffee = 1.5
        kopi_content.condensed_milk = 0
    else if parse_name == 'kopi o po'
        kopi_content.coffee = 0.5
        kopi_content.condensed_milk = 0
    else if parse_name == 'kopi o siew dai'
        kopi_content.sugar = 0.5
        kopi_content.condensed_milk = 0
    else if parse_name == 'kopi gau'
        kopi_content.coffee = 1.5
    else if parse_name == 'kopi po'
        kopi_content.coffee = 0.5
    else if parse_name == 'kopi siew dai'
        kopi_content.sugar = 0.5
    else if parse_name == 'kopi gah dai'
        kopi_content.condensed_milk = 1.5
    else if parse_name == 'kopi si'
        kopi_content.condensed_milk = 0
        kopi_content.evaporated_milk = 1
    else if parse_name == 'kopi si kosong'
        kopi_content.condensed_milk = 0
        kopi_content.evaporated_milk = 1
        kopi_content.sugar = 0
    else if parse_name == 'kopi kosong'
        kopi_content.condensed_milk = 0
        kopi_content.evaporated_milk = 0
        kopi_content.sugar = 0

    kopi_content



  stringify: (i={}) ->
    if i.condensed_milk > 0
      milk = ''
    else if i.evaporated_milk > 0
      milk = ' C'
    else
      milk = ' O'

    if i.sugar == 0
      sugarLevel = ' Kosong'
    else if i.sugar < 1
      sugarLevel = ' Siew Dai'
    else if i.sugar >= 1
      sugarLevel = ''

    if i.coffee == i.water
      coffeeLevel = ''
    else if i.coffee > i.water
      if i.condensed_milk > i.water
        coffeeLevel = ' Gah Dai'
      else
        coffeeLevel = ' Gau'
    else
      coffeeLevel = ' Po'

    "Kopi#{milk}#{coffeeLevel}#{sugarLevel}"

module.exports = new Kopi
