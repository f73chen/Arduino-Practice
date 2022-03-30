const int switchPin = 2; // the input pin
long startcount; // Store the first time value returned from millis
long duration; // Store the duratation of a period or part there of of the incoming signal
float period; // Store the calculated period of the incoming signal (in seconds)
float scaled_period; // Store the scaled values of period (if necessary) due to timer clock changes
float frequency; // Store the calculated frequency in Hz

void setup()
{
  Setup input pin here
  Serial.begin(9600); //sets up communication wit the serial monitor
/*  TCCR0B = ( _BV(CS02) | _BV(CS00));/* Writes to Timer0 register to change it's clock rate
                                        this would sets bit CS02 and CS00 to 1 so timer clock = clkIO/1024 see "_BV Explained.pdf" on LEARN*/
}

void loop()
{
    Read the state of the pin and use it to determine where you are in the clock cycle
    Find a starting point to start measuring frequency 
    startcount = millis(); // use millis() to get your starting time (returned in milliseconds) for your measurement
**NOTE: millis() assumes that the CS02:CS01 = 3 (default set by Uno board). 
        If this is not the case you will need to scale the millis() result, see page 109/110 of datasheet.
    Read the state of the pin to determine when to get a second time measurement used to calculate frequency 
    duration = millis() - startcount; // calculating the duration in miliseconds of a complete or part cycle
    period = calculate the period of the incoming signal - converted to seconds 
    scaled_period = Scale the period if necessary due to changes in the counter frequency 
    frequency= Calculate the frequency
    Serial.print(" Frequency is = ");
    Serial.println(frequency);

  }
}

