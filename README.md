# The Roomba Test

An object-oriented, test-driven exercise with the objective of designing the logic for an interface that would remotely control a self-driving hoover robot.

## How it works

All information is passed in via a text file

e.g
```
5 5 (length and depth of the room)
1 2 (initial position of the hoover)
1 0 (locations
2 2 of
2 3 dirt patches)
NNESEESWNWW (instructions sent to the hoover)
```

Load up the file, and the hoover will whiz around and clean up the room wherever it goes!

### Tech used
- Ruby 2.5.1p57
- RSpec 3.8
- SimpleCov 0.16.1
- RuboCop 0.71.0

## Using the app

A quick run-down of how to load and use the application

### Getting started

- Make sure you are running from the root directory `roomba-test/`

- Make sure you have Bundler version 2 or later installed `gem install bundler`

- Install dependencies: `bundle`

- Open the REPL: `irb`

- Load up the Controller: `load 'lib/controller.rb'`

- Create a new instance of Controller: `example = Controller.new('input.txt')`

### Moving the hoover

- Move the hoover with the `#move_hoover` method

- Perform this method without argument to send the instructions provided by the text file

```
x.move_hoover
 => "Hoover has moved to (1, 3)"
```

__OR__

- Pass in your own argument to override this and navigate the hoover yourself

```
example.move_hoover('EEENW')
 => "Hoover has moved to (3, 4)"
```

- After the first move, you can see the hoover's position and how many dirty patches are left with `#position_and_dirty_patches`

```
example.position_and_dirty_patches
Position: (1, 3)
Dirt remaining: 2
```

### Locating the hoover

- This is done with the `#print_output` method

- This will print (to stdout) the x, y location of the hoover, as well as the number of patches of dirt it has cleaned up

```
example.print_output
3, 4
1
```

### Running tests

From the root directory, run: `rspec`

You should see the result of the tests, along with a coverage report from SimpleCov

You can also run the linter, RuboCop: `rubocop`
