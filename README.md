
Setup

    Think through the data architecture required to bring this to life.
    Create a new Rails app, e.g. odin-flight-booker, and a new Git repo
    Modify the README to explain what you’re doing and link back to the project here.

Screen 1: Search

For the first screen, you’ll need a dropdown that lists a possible “From” airport and a possible “To” airport. just assume all flights fly between SFO and NYC. You’ll need to set up a dropdown menu that contains all eligible flights.

This requires relatively vanilla forms that happen to be prepopulated with collections of data. Working with dates will cover a bit of new ground for you.

    Create an Airport model (which basically just needs an airport code like “SFO” or “NYC”) and use the db/seeds.rb file to create several of them.
    Create a Flight model (with the start and finish airport ids, start datetime, and flight duration).
    Set up associations so you can ask Flight.first.from_airport, Flight.first.to_airport and get back Airport objects. Same for Airport.first.departing_flights and Airport.first.arriving_flights, which should return a list of flight objects.
    Seed your database with flights.
    You will search and view results in the same page. Set up your FlightsController and routes to make the Index page (/flights) the root route.
    Create your search form on the /flights index page to submit using a GET (not POST) request back to the same URL.
    The home page should contain four dropdown menus – a list of FROM and TO airports, number of passengers (1-4), and a DATE dropdown for the flight date. The DATE dropdown should only include dates that have existing flights. Don’t worry about restricting the contents of the FROM/TO dropdowns – you’d normally use Javascript – so just allow the user to select any airport. See this SO post on formatting date in dropdown lists, this quickie SO post on selecting months/years, and the Rails DateHelper API Docs for some help with creating Date selects.

Screen 2: Pick a Flight

Once search results are returned, the user just needs to choose from among the eligible flights.

    Once the user has submitted the form, your controller should detect the additional query parameters (e.g. from /flights?from_code=SFO&to_code=NYC&date=20131215&num_tickets=2) and should pull the flights which match that criteria from your database through smart querying model methods.
    Send those flights back to your app/views/flights/index.html.erb view. Make it so that the view will display the results below (if present).
    Don’t get rid of the search dropdowns – keep the search form active at the top so the user can try running a new search.
    The search results will need to be in their own form – this time for selecting which of the flights the user would like to choose. Each returned flight should render with a radio button next to it. The user will select which flight to submit and move onto the next step. The form should submit to the #new action of the BookingsController you’re about to create using another GET method. You’ll need to include a hidden field that contains the number of passengers.

Screen 3: Passenger Information

Once the user has submitted their chosen flight, it’s time to take their booking information. You’ll need a form to submit the Booking and also create a Passenger object for each passenger who needs a ticket. Don’t worry about creating a separate “Ticket” object, we’ll assume the airline will issue those once the booking is verified.

    Create and migrate the Booking model
    Create and migrate the Passenger model (just keep the information simple – name and email only)
    Set up associations between Bookings, Passengers, and Flights.
    Create a BookingsController and appropriate routes.
    Set up your #new action, which should have received the flight ID and passenger number parameters, and use it to help render a form for a new booking which displays the currently chosen date, airports, flight ID and a set of fields to enter personal information for each passenger. You’ll want to create a new blank Passenger object in your controller for each passenger, and then use #fields_for in the view to set up the sub-forms.
    Try submitting the form and check out the parameters in your server.
    You’ll need your #create action to create a new Booking (linking it to the appropriate Flight) but it will also need to accept the nested attributes for each of the Passenger objects and create a new Passenger from them. Be mindful of whitelisting the nested parameters as well.
    Go to the Booking model and implement the #accepts_nested_attributes_for method. See the Rails API for examples and this SO post for another.
    Once your form is successfully submitted, render the booking’s #show page which displays the booking information (flight and passenger information).
    Make sure your ticketing flow is working properly. Good work!


