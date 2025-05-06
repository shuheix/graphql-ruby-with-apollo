ws = Workspace.create!(name: "sample_workspace")
5.times do |m|
  ws.channels.create!(name: "channel_no_#{m}")
end