command: "echo $(~/.dotfiles/ubersicht/scripts/yabai-current-window)"

refreshFrequency: 250 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/styles.css" />
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/colors.css" />
    <div id="content"></div>
  """

style: """
  left: 180px
  top: 4px
  """

content: (output) ->
  """
    <span class="white"><i class="icon fa fa-window-maximize" aria-hidden="true"></i>#{output}</span>
  """

update: (output, domEl) ->
  $(domEl).find('#content').html(@content(output))
