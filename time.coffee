command: "echo $(~/.dotfiles/ubersicht/scripts/current-time)"

refreshFrequency: 1000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/styles.css" />
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/colors.css" />
    <div id="content"></div>
  """

style: """
  right: 8px
  top: 4px
  """

content: (output) ->
  """
    <span class="white"><i class="icon fa fa-clock-o purple" aria-hidden="true"></i>#{output}</span>
  """

update: (output, domEl) ->
  $(domEl).find('#content').html(@content(output))
