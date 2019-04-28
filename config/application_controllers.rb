class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do
    erb :index
  end
  
  get "/help" do
    erb :help
  end
  
  get "/about" do
    erb :about
  end
  
  get '/result' do
    @zipcode = params[:zipcode]
    @locations =
      {
        'central harlem' => ["http://www.harlemgrown.org/", "https://www.harlemonestop.com/organization/1310/harlem-dowling-west-side-center-for-children-and-family-services", "http://www.coalitionforthehomeless.org/resources/salvation-army-east-harlem-community-center/"],
        'chelsea' => ["https://www.foodpantries.org/ci/ny-chelsea", "https://www.volunteermatch.org/search/opp2427690.jsp", "https://volunteermatch.networkforgood.com/?code=Footer"],
        'gramercy Park/ murray hill' => ['https://www.foodbanknyc.org/donate-food/','http://www.foodbanknyc.org/volunteer/', 'https://secure3.convio.net/fbnyc/site/Donation2?df_id=7464&mfc_pref=T&7464.donation=form1&_ga=2.210780370.694228225.1534401644-1055037965.1534401644'],
        'soho greenwich' => ['https://www.cityharvest.org/programs/donate-food/','https://www.sohostudiosmiami.com/our-blog/2017/9/27/how-to-create-an-event-that-helps-support-disaster-relief', 'https://giving.cityharvest.org/donate-now'],
        'lower manhattan' => ['https://www.homelessshelterdirectory.org/cgi-bin/id/cityfoodbanks.cgi?city=Manhattan&state=NY','https://www.nycservice.org/search/','https://donatenow.networkforgood.org/nycmedics'],
        'upper east side' => ['https://www.foodbanknyc.org/donate-food/','https://www1.nyc.gov/site/em/volunteer/nyc-cert.page','https://secure3.convio.net/fbnyc/site/Donation2?df_id=5844&mfc_pref=T&5844.donation=form1&recurring=1&_ga=2.47253479.1983913834.1534424903-118813911.1534424903'],
      }
    erb :result
  end

end

Folder:views
File: help.erb 
<form id="get-zipcode" method='get' action='/result'>
  <p>What's your zipcode? <input type="text" name="zipcode"> </p>
  <p><input type="submit"></p>
</form>

Folder:views 
File: result.reb
<% if (@zipcode == "10026" || @zipcode == "10027" || @zipcode =="10030" ||@zipcode == "10037" || @zipcode == "10039") %>
  <% neighborhood = "central harlem" %>

<% elsif (@zipcode == "10001" || @zipcode == "10011"|| @zipcode == "10018" ||@zipcode == "10019" || @zipcode == "10036")%>
  <% neighborhood = "chelsea" %>

<% elsif (@zipcode == "10010" || @zipcode == "10016"|| @zipcode == "10017" ||@zipcode == "10022") %>
  <% neighborhood = "gramercy Park/ murray hill" %>

<% elsif (@zipcode == "10012" ||  @zipcode == "10013" || @zipcode == "10014")
  neighborhood = "soho greenwich"%>

<% elsif (@zipcode == "10004" || @zipcode == "10005" || @zipcode == "10006" || @zipcode == "10007" || @zipcode == "10038" || @zipcode == "10280")
  neighborhood = "lower manhattan"%>

<% elsif (@zipcode == "10021" || @zipcode == "10028" || @zipcode == "10044" || @zipcode == "10065" || @zipcode == "10075" || @zipcode == "10128")
  neighborhood = "upper east side"%>
<% end %>

<h1><%="#{neighborhood}"%></h1>

<% links = @locations[neighborhood] %>

<h1>Food: </h1><a href='<%= links[0] %>'>Food</a>
<h1>Time: </h1><a href='<%= links[1] %>'>Time</a>
<h1>Donations: </h1><a href='<%= links[2] %>'>Donations</a>

