command: "echo $(~/.dotfiles/ubersicht/scripts/wifi)"

refreshFrequency: 5000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/styles.css" />
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/colors.css" />
    <div id="content"></div>
  """

style: """
  right: 415px
  top: 4px
  """

color: (output) ->
  if output.trim() == "OFF"
    return "red"
  else
    return "blue"

text: (output) ->
  if output.trim() == "OFF"
    return "N/A"
  else
    return output

content: (output) ->
  """
    <span class="#{@color(output)}"><i class="icon fa fa-wifi" aria-hidden="true"></i> #{@text(output)}</span>
  """

update: (output, domEl) ->
  $(domEl).find('#content').html(@content(output))
