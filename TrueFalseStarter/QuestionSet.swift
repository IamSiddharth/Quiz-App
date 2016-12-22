//
//  Question Set.swift
//  TrueFalseStarter
//
//  Created by Siddharth Doshi on 22/12/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//


//---------------------------------------------------------------------

/////////////////////////
// Question Set Format //
/////////////////////////
/*
 
 // Question <Question Number>
 // ---------------
 
class Que<Question Number>: Question {
    override init() {
        super.init()
 
        que = ""
 
        op1 = ""
        op2 = ""
        op3 = ""
        op4 = ""
 
        ans = <Answer Variable>
    }
}
 
 */


// ## Parent Class for all Question Set ##

class Question {
    var que = ""
    
    var op1 = ""
    var op2 = ""
    var op3 = ""
    var op4 = ""
    
    var ans = ""
    
}

// ** Previous Questions **

// Previous Question 1
// ---------------

class OldQue1: Question {
    override init() {
        super.init()
        
        que = "Only female koalas can whistle"
        
        op1 = "True"
        op2 = "False"
        op3 = ""
        op4 = ""
        
        ans = op2
    }
}

// Previous Question 2
// ---------------

class OldQue2: Question {
    override init() {
        super.init()
        
        que = "Blue whales are technically whales"
        
        op1 = "True"
        op2 = "False"
        op3 = ""
        op4 = ""
        
        ans = op1
    }
}

// Previous Question 3
// ---------------

class OldQue3: Question {
    override init() {
        super.init()
        
        que = "Camels are cannibalistic"
        
        op1 = "True"
        op2 = "False"
        op3 = ""
        op4 = ""
        
        ans = op2
    }
}

// Previous Question 4
// ---------------

class OldQue4: Question {
    override init() {
        super.init()
        
        que = "All ducks are birds"
        
        op1 = "True"
        op2 = "False"
        op3 = ""
        op4 = ""
        
        ans = op1
    }
}

// Question 1
// ---------------

class Que1: Question {
    override init() {
        super.init()
        
        que = "This was the only US President to serve more than two consecutive terms."
        
        op1 = "George Washington"
        op2 = "Franklin D. Roosevelt"
        op3 = "Woodrow Wilson"
        op4 = "Andrew Jackson"
        
        ans = op2
    }
}

// Question 2
// ---------------

class Que2: Question {
    override init() {
        super.init()
        que = "Which of the following countries has the most residents?"
        
        op1 = "Nigeria"
        op2 = "Russia"
        op3 = "Iran"
        op4 = "Vietnam"
        
        ans = op1
    }
}

// Question 3
// ---------------

class Que3: Question {
    override init() {
        super.init()
        
        que = "In what year was the United Nations founded?"
        
        op1 = "1918"
        op2 = "1919"
        op3 = "1945"
        op4 = "1954"
        
        ans = op3
    }
}

// Question 4
// ---------------

class Que4: Question {
    override init() {
        super.init()
        
        que = "The Titanic departed from the United Kingdom, where was it supposed to arrive?"
        
        op1 = "Paris"
        op2 = "Washington D.C."
        op3 = "New York City"
        op4 = "Boston"
        
        ans = op3
    }
}

// Question 5
// ---------------

class Que5: Question {
    override init() {
        super.init()
        
        que = "Which nation produces the most oil?"
        
        op1 = "Iran"
        op2 = "Iraq"
        op3 = "Brazil"
        op4 = "Canada"
        
        ans = op4
    }
}

// Question 6
// ---------------

class Que6: Question {
    override init() {
        super.init()
        
        que = "Which country has most recently won consecutive World Cups in Soccer?"
        
        op1 = "Italy"
        op2 = "Brazil"
        op3 = "Argetina"
        op4 = "Spain"
        
        ans = op2
    }
}

// Question 7
// ---------------

class Que7: Question {
    override init() {
        super.init()
        
        que = "Which of the following rivers is longest?"
        
        op1 = "Yangtze"
        op2 = "Mississippi"
        op3 = "Congo"
        op4 = "Mekong"
        
        ans = op2
    }
}

// Question 8
// ---------------

class Que8: Question {
    override init() {
        super.init()
        
        que = "Which city is the oldest?"
        
        op1 = "Mexico City"
        op2 = "Cape Town"
        op3 = "San Juan"
        op4 = "Sydney"
        
        ans = op1
    }
}

// Question 9
// ---------------

class Que9: Question {
    override init() {
        super.init()
        
        que = "Which country was the first to allow women to vote in national elections?"
        
        op1 = "Poland"
        op2 = "United States"
        op3 = "Sweden"
        op4 = "Senegal"
        
        ans = op1
    }
}

// Question 10
// ---------------

class Que10: Question {
    override init() {
        super.init()
        
        que = "Which of these countries won the most medals in the 2012 Summer Games?"
        
        op1 = "France"
        op2 = "Germany"
        op3 = "Japan"
        op4 = "Great Britian"
        
        ans = op4
    }
}

		
