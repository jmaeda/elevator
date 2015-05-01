# elevator
cosi 105b elevator program
<a href="https://codeclimate.com/github/jmaeda/elevator"><img src="https://codeclimate.com/github/jmaeda/elevator/badges/gpa.svg" /></a>


NOTE: Run with "ruby sim.rb" not "ruby simul.rb"

For my code, simulation tells building to create the environment and can add people and extra elevators as necessary. Simulation also handles ticks which get called on the elevator(s). Lastly it holds the logic and code behind what the elevator should do at each tick. The elevator class is mostly told what to do and thus contains a lot of get and set methods. The building class builds the environment by creating floors and elevators and storing them in arrays. It also plays a large role in the output of the state of the program at each tick by bringing together the different to_s methods. Floor keeps track of people who are waiting for an elevator and people who have arrived at their destination. Lastly, the person class holds the floor the person wishes to go to.

In general, the logic is that the simulation class will direct the elevator based on different conditions/states of the overall environment. If the elevator is empty, it will diverge into a different set of calls than if it is carrying people. When empty the elevator either searches for the closest person to pick up or returns to its resting floor. When it is carrying people, it will go as far as necessary in one direction before heading back the other direction. In general, the elevator picks up anyone waiting when it visits a floor and drops off everyone who wants to get off. People waiting to get picked up are represented by "P" and people who have already arrived are represented by "A" in the visual output. 

As for making the code well written, I made sure methods were small and served one purpose. I also avoided direct access to variables through other classes. I admit that due to my lack of time I ended up making the classes more dependent on one another than I would have hoped. In general though, I don't believe I did too bad of a job. 
