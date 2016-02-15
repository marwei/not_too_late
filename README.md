# NotTooLate

This gem is inspired by [Gitfiti](https://github.com/gelstudios/gitfiti), a github history calendar graffiti tool. However, rather than creating noise commits, NotTooLate lets you spread actual commits over the history.

If you are an awesome coder but a late starter on github, or if you have been doing so much private development that your public feed is drawing a blank, this gem is for you.

What does it do? Simple, you work on new projects as always, but instead of running straight git commands, you prefix it with "ntl" (not too late) like this:

`$ ntl git commit -am "this is not too late" `

Voila, you've traveled back in time and made a commit.

## Installation

Add this line to your application's Gemfile:

	gem 'not_too_late'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install not_too_late

## Usage

Caveat: Although git doesn't complain about messed-up commit timestamps, it is not recommended to use this gem on existing projects that have prior commits. It is also not a good idea to use this gem for multi-contributor projects unless all contributors use this gem with the same configuration.

### Setup

Initialize git repo

    $ git init .

Initialize ntl configuration
    
    $ ntl init
    
Specify how far you want to go back in history

	# all commit actions hereafter will be executed with the timestamp of current_time - 100 days
	$ ntl config --set 100

Or
	
	# all commit actions hereafter will be executed as if today was 02/05/2015
	$ ntl config --go 02-05-15

### Use

* Run git actions with `ntl`

	eg.

		$ ntl git commit -am "message"
		$ ntl git checkout -b "branch"
		$ ntl git merge "branch"
		...

	ntl will ask for sudo password twice, once before the commit and once after. This is because the gem makes use of `date` command under the hood to change the system time.
	
* Fast forward or roll back in time

		# All commit actions hereafter will be current_time - (previously_specified_date - 7 days)
		$ ntl config --forward 7
		
		# Similarly
		$ ntl config --backward 7
		
## Todo
* Add Linux support
* Add Windows support
* Add set and revert system time commands

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marwei/not_too_late.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

