# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = [User.new(name:'Claudio', lastname:'Alvarez', \
     password:'4fdaef56', email:'calvarez1@miuandes.cl', phone:569987754,\
              address:'San Carlos de Apoquindo'), 
         User.new(name:'Juan', lastname:'Rataplan', \
              password:'001234dadf56', email:'jrataplan@miuandes.cl', phone:775654889,\
              address:'San Carlos de Apoquindo'),
         User.new(name:'Raul', lastname:'Rabufetti', \
              password:'23fdsafd456', email:'rrabufetti@miuandes.cl', phone:822705642,\
              address:'San Carlos de Apoquindo'),
         User.new(name:'Raul', lastname:'Ganfolfi', \
              password:'fdsafs23456', email:'rgandolfi@miuandes.cl', phone:225393142,\
              address:'San Carlos de Apoquindo'),
         User.new(name:'Licenciado', lastname:'Varela', \
              password:'234fdfsas56', email:'lvarela@miuandes.cl', phone:923777685,\
              address:'San Carlos de Apoquindo')]
              
for u in users do
  u.save!
end 

event_venues = [EventVenue.new(name: 'Estadio Nacional: JULIO Martinez ', address:'Maraton', capacity: 60000),\
                EventVenue.new(name: 'Estadio Monumental: David Arellanos', address:'Exequiel', capacity: 25000),\
                EventVenue.new(name: 'Movistar Arena: Parque Ohiggins', address:'Matta', capacity: 15000)]
                
for ev in event_venues do
  ev.save!
end 

evasd=Event.new(name:'MetalFest', description: 'Puro metal',start_date: '2018-12-12', event_venue: event_venues[1])
evasd.save!

events = [Event.new(name:'Festival de la Cancion', description: 'Puro reggaeton',\
          start_date: '2019-06-01', event_venue: event_venues[0]),
          Event.new(name:'Twisted Sister', description: 'Puro rock',\
          start_date: '2019-12-12', event_venue: event_venues[1]),
          Event.new(name:'Bad Bunny', description: 'Puro Trap',\
          start_date: '2019-06-04', event_venue: event_venues[2])]
for e in events do
  e.save!
end 

ticket_zones = [TicketZone.new(zone: 'Cancha'),\
                TicketZone.new(zone: 'Pacifico'),\
                TicketZone.new(zone: 'Pacifico VIP')]

for tz in ticket_zones do
  tz.save!
end 

prices = [20000, 30000, 40000]

ticket_types = []

for e in events do
  i = 0
  for t in ticket_zones do
      ticket_types << TicketType.new(price: prices[i], ticket_zone: t, event: e)
      i += 1
  end
end

for tt in ticket_types do
  tt.save!
end 

for u in users do
  for e in events do
    o = Order.new(user: u)
    o.save!
    tts = TicketType.where(event:e)
    tt = tts.sample # get any ticket type available
    t = Ticket.new(order:o, ticket_type:tt)
    t.save!
  end
end


