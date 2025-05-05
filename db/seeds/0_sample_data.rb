account = Account.create!
workspace = Workspace.create(name: 'test')

account.workspaces << workspace

channel = workspace.channels.create!

channel.messages.create!(content: 'sample_content')
