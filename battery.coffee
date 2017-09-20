command: "echo $(~/.dotfiles/ubersicht/scripts/battery)"

refreshFrequency: 30000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/styles.css" />
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/colors.css" />
    <div id="content"></div>
  """

style: """
  right: 340px
  top: 4px
  .icon
    position: relative
  .charging
    position: relative
    right: -26px
    z-index: 1
  """

color: (output) ->
  [_status, percentage] = output.split('@')

  percentage = parseInt(percentage)

  if percentage >= 50
    return "green"
  else if percentage >= 15
    return "yellow"
  else
    return "red"

icon: (output) ->
  [_status, percentage] = output.split('@')

  percentage = parseInt(percentage)

  if percentage > 90
    "fa-battery-full"
  else if percentage > 65
    "fa-battery-three-quarters"
  else if percentage > 40
    "fa-battery-half"
  else if percentage > 15
    "fa-battery-quarter"
  else
    "fa-battery-empty"

charging_icon: (output) ->
  [status, _percentage] = output.split('@')

  if status == 'AC'
    return """
      <span class="charging white icon"><i class="fa fa-bolt" aria-hidden="true"></i></span>
    """
  else
    return ""

content: (output) ->
  """
    #{@charging_icon(output)}
    <span class="#{@color(output)}"><i class="icon fa #{@icon(output)}" aria-hidden="true"></i>#{parseInt(output.split('@')[1])}%</span>
  """

update: (output, domEl) ->
  $(domEl).find('#content').html(@content(output))
