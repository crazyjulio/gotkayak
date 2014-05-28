# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#TODO:
# 1. Add additional images for products, such as shots of the wells, foot rest areas, etc.
# 2. Need to set up main trip images, a google map with launch and takeout points marked. In order to do this, I'll
#have to add a field to trips where I can store html strings for the embedded iframes.

Dadmin.create!(:email => 'tom@gotkayak.com', :password => 'password', :password_confirmation => 'password')
Dadmin.create!(:email => 'jason@gotkayak.com', :password => 'password', :password_confirmation => 'password')

#Events

event1 = Event.create!(:name => "Spring is here", :tag => "Event", :body => "Spring is here and consistent paddling weather is fast approaching. Don't be caught on the shore while your buddies are out on the water. Contact us today!")
event2 = Event.create!(:name => "Kayaks in stock", :tag => "Event", :body => "We've got plenty of kayaks in stock and are ready to rock. Set up a demo with us today and get out on the water to try boats before you buy. Let's see a big box store do that!")
news1 = Event.create!(:name => "New website!", :tag => "News", :body => "Old Dominion Kayaks is pleased to announce that we have a new website! Some things have changed a bit, so cruise around and see what's new. The new website will allow us to add new features to the site in a way we couldn't before. So keep an eye out for improvements over the coming months. Also, spring is here and we've got plenty of boats in stock and waiting for you. Cobra Fish-n-Dives and a great selection of Malibu kayaks are ready to get you out on the water. Drop a line and let us know you're interested today!")

#Event images
##Image.create!(:file => File.open(File.join(Rails.root, "/public/images/kayaks/malibu/x_factor/xfactor_3quarter.jpg")), :model => "Event", :model_id => news1.id, :tag => "main", :caption => "")

#Bodies of Water
james_river = Waterbody.create!(:name => 'James River', :state => 'Virginia', :country => 'USA', :water_type => 'river', :description => "Being from Richmond, we take our Malibu Kayaks out on the James all the time, for short trips and all-day trips when we can. At Old Dominion Kayaks, we decided in early summer 2009 to travel the length of the James to see and fish the entire river and see how well the Malibu kayaks hold up under the diverse conditions presented by a mountains to bay trip. The following is a mini-documentary of our trips from the headwaters in Iron Gate, VA to where the James meets the Chesapeake Bay at Fort Monroe, 340 miles later.")
south_anna = Waterbody.create!(:name => 'South Anna River', :state => 'Virginia', :country => 'USA', :water_type => 'river', :description => "A very narrow little river with a fun stretch between routes 33 and 54, if the water is high enough.")
rockfish = Waterbody.create!(:name => 'Rockfish River', :state => 'Virginia', :country => 'USA', :water_type => 'river', :description => "A narrow, shallow river with a few little riffles to keep things interesting. Very pretty, but very open, not much tree cover.")

#waterbody images
#Image.create!(:file => File.open(File.join(Rails.root, "/public/images/trips/rockfish/schuyler_to_warren/1228.JPG")), :model => "Waterbody", :model_id => rockfish.id, :tag => "main", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "/public/images/trips/south_anna/route33_to_route54/1193.JPG")), :model => "Waterbody", :model_id => south_anna.id, :tag => "main", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "/public/images/trips/james_river/main/Jamesrivermap.png")), :model => "Waterbody", :model_id => james_river.id, :tag => "main", :caption => "credit: Wikipedia")

#Paddlers
tom = Paddler.create!(:name => "Tom Lyles", :height => "6' 2\"", :weight => '210')
jason = Paddler.create!(:name => "Jason Lyles", :height => "6' 3\"", :weight => '215')
brian = Paddler.create!(:name => "Brian Lyles", :height => "6' 1\"", :weight => '200')
michael = Paddler.create!(:name => "Michael Lyles", :height => "6' 1\"", :weight => '180')
matthew = Paddler.create!(:name => "Matthew Lyles", :height => "6' 0\"", :weight => '170')
david = Paddler.create!(:name => "David Lyles", :height => "6' 0\"", :weight => '200')
grandpa = Paddler.create!(:name => "James Lyles", :height => "5' 10\"", :weight => '190')

#Manufacturers
man1 = Manufacturer.create!(:name => 'Malibu Kayaks', :description => 'Malibu Kayaks has some great boats that we love to use every time we get out on the water. We have paddled almost the entire length of the James River solely on Malibu kayaks.', :notes => 'Josh Eck is my POC. X-Factors rock, Tandems suck.', :link => 'http://www.malibukayaks.com')
man2 = Manufacturer.create!(:name => 'Cobra Kayaks', :description => "We're new to Cobra, and not sure how we feel about them yet. Fish and Dive seems good. Navigator might be terrible.", :notes => 'Navigator is a bust.', :link => 'http://www.cobrakayaks.com')

#Questions
Question.create!(:question => "I want to try a kayak before I buy it. How do I set up a demo with Old Dominion Kayaks?", :answer => "Email me at tom@gotkayak.com Tell me the boats you want to try out and where you are located. I will work with you to set up a time and place to try out our boats. I am confident that you will find that one of my kayaks is perfect for you.")
Question.create!(:question => "I want to try a kayak before I buy it, but Richmond is a long drive for me. Will you be giving demos anywhere other than Richmond?", :answer => "Yes. One weekend a month during the warm months, Old Dominion Kayaks will be traveling for demo days. We will bring some of each of our kayaks and head to popular kayaking destinations in Virginia, such as the Eastern Shore or Virginia Beach. Look for announcements on our home page for dates and locations.")
Question.create!(:question => "How do I buy a kayak from Old Dominion Kayaks?", :answer => "Email me at tom@gotkayak.com Old Dominion Kayaks is a small business with a personal touch. I will spend the time with you to price out options for your new boat, and talk you through what you may or may not need in a boat. Tell me what options, colors and boats you are interested in, and we will set you up in the boat that will fit you and your outdoor lifestyle best. Already know which Malibu kayak you want? Email me and we'll set up a time for you to see what we have or schedule a demo.")
Question.create!(:question => "How can I arrange to pick up a boat from you when I live a few hours away from Richmond, Virginia?", :answer => "We understand that a lot of folks on the eastern seaboard would like to buy a kayak, but may be turned off by the long drive to Richmond. We are willing to drive to meet you at a convenient location. Just be prepared to take the kayak home: have a roof rack, kayak holders and straps, or some other setup ready. The distance will be determined on a case by case basis. If you buy more than one kayak from us at a time, we will try to arrange to bring them directly to you.")
Question.create!(:question => "I destroyed my kayak. It was my fault. Will my warranty help me?", :answer => "Yes! Although we are very surprised that you have managed to destroy one of our incredibly tough kayaks, we understand that tragic accidents can happen. Fortunately, Malibu Kayaks LLC. has the best warranty in the business, period.")
Question.create!(:question => "What material is used in constructing Malibu Kayaks LLC. kayaks?", :answer => "Malibu Kayaks Inc. kayaks are manufactured using Super Linear Polyethylene.")
Question.create!(:question => "Can I store my kayak outside?", :answer => "Yes. However, it is not recommended that you leave your kayak exposed to direct sunlight for long periods of time.")
Question.create!(:question => "I find water in my kayak after use. Is this normal?", :answer => "Yes, it is normal to find small amounts of water in your kayak. Water can enter through seals in the hatches and condensation often forms when a kayak is used in cool water. The drain plug is provided to remove the water from the kayak. Leaving hatches open while in storage will allow remaining water to evaporate. If water is left in the kayak for long periods of time a stale smell will likely develop.")
Question.create!(:question => "How should I care for my kayak?", :answer => "Your kayak requires very little maintenance. Although salt water will not harm the plastic hull, we recommend rinsing off your kayak after every salt water trip. This will keep hatch operating mechanisms and sealing surfaces free from salt and debris in order to assure easy operation.")
Question.create!(:question => "What should I use to clean my kayak?", :answer => "For general cleaning, a kitchen cleanser such as Comet or Ajax and a scrub brush work well. To remove stains or tar, baby oil works well.")
Question.create!(:question => "Are Malibu Kayaks Inc. kayaks made in the USA?", :answer => "Absolutely. All Malibu Kayaks LLC. kayaks are constructed in Orange county, California.")
Question.create!(:question => "I have a small cut in the hull of my kayak. Can it be repaired?", :answer => "Yes, it's easy to fix. Even though it is very hard to cut or damage our kayaks, if it does happen, then give us a call at (804) 833-7220, let us know the color of your kayak, and we will send you repair material. You will then need a soldering iron to 'weld' the repair material into the damaged area.")
Question.create!(:question => "What colors do you recommend for best visibility to other boaters?", :answer => "We recommend either mango or yellow for best visibility to other boaters.")
Question.create!(:question => "Will other manufacturers' accessories work on my Malibu Kayaks LLC. kayak?", :answer => "Many accessories from other manufacturers such as backrests, paddle and rod holders, knee straps or kayak carts will work with your Malibu Kayaks LLC. kayak. If you are unsure about a particular accessory, just give us a call at (804) 833-7220.")
Question.create!(:question => "If my kayak ever becomes unusable, is it recyclable?", :answer => "Yes. The Super Linear Polyethylene plastic that we use is recyclable.")
Question.create!(:question => "Can I mount a trolling motor to my Malibu Kayak?", :answer => "Of course. Generally, a 25-30 lb thrust electric motor is used and works well with a deep cycle marine battery. The motor mount extends off the starboard side of the kayak behind the seat. Trolling motor mounts are only recommended for the following Malibu Kayak models: Stealth 14 and the X-Factor.")
Question.create!(:question => "My Kayak has two molded-in nut inserts. What are they for?", :answer => "Those are there so that you can attach a motor mount for a trolling motor.")
Question.create!(:question => "Can the Pro2 Tandem be used as a one-seater?", :answer => "Yes. The Pro2 Tandem's seating design allows a single paddler to paddle comfortably from the rear seat.")
Question.create!(:question => "I strapped my kayak down on my roof rack too tightly and now I have a dent in the bottom. Is there any way to fix this?", :answer => "If the dent won't push out easily, leave the kayak in the sun with a black trash bag over the area. This should heat and soften the plastic to the point that you can easily push the dent out of the hull.")

#Products
product1 = Product.create!(:length => 120,:name => "Sierra 10",:product_type => 'kayak',:weight => 720,:width => 31,:manufacturer_id => man1.id,:height => 15.25, :capacity => 5200, :description => "Our 'All New' sit-inside style kayak offers the best of both worlds. A large rear well storage area, two flush mount rod holders along with various mounting areas for rod holders, fish finders, GPS systems and more.")
product2 = Product.create!(:length => 111, :name => "Mini-X", :product_type => 'kayak', :weight => 736, :width => 33.5, :manufacturer_id => man1.id, :capacity => 5200, :description => "If you fish or dive Mini-X can't be beat! With flush mount rod holders, round hatches, and a large center hatch it's the best fishing kayak in its class.")
product3 = Product.create!(:length => 150, :name => "Pro Explorer", :product_type => 'kayak', :weight => 976, :width => 31, :manufacturer_id => man1.id, :capacity => 7200, :description => "The Pro Explorer is designed for easy paddling, stability, fishing, diving, and is stackable for easy storage. It features dry seating, a cup holder, large storage capacity and molded multi-foot rests make getting comfortable easy for every paddler.")
product4 = Product.create!(:length => 172, :name => "X Factor", :product_type => 'kayak', :weight => 1184, :width => 33, :manufacturer_id => man1.id, :capacity => 10000, :description => "If you fish or dive Hard Core the 'All New' X-Factor can't be beat! The large front hatch can be upgraded with our new child seat... 'Gator Hatch'. Malibu Kayaks X-Factor is 'The Ultimate Fish & Dive Kayak'.")
product5 = Product.create!(:length => 166, :name => "X 13", :product_type => 'kayak', :weight => 1184, :width => 29, :manufacturer_id => man1.id, :capacity => 7200, :description => "The Malibu Kayaks X-13 offers both speed and stability for a wide range of paddlers with a plethora of fishing ideas! Includes large bow storage, low profile Gator Hatch child's seat, large center hatch with bag, side carry/paddle holders, large open rear well, rod holders with optional X-Wing Sliding Console.")
product6 = Product.create!(:length => 156, :name => "Pro 2 Tandem", :product_type => 'kayak', :weight => 1040, :width => 33, :manufacturer_id => man1.id, :capacity => 8800, :description => "The Pro2 Tandem is the ultimate two seater kayak. Designed for all-around ocean, lake and flatwater paddling, fishing and scuba diving, the Pro2 Tandem is exceptionally stable and easy to paddle for one person or two.")
product7 = Product.create!(:length => 148, :name => "Stealth 12", :product_type => 'kayak', :weight => 1184, :width => 33, :manufacturer_id => man1.id, :capacity => 7200, :description => "The Stealth 12 is a smaller version of the Stealth 14, offering our brand new patented casting platform and center live well storage system. This 3-hatch center deck offers extra storage capacity and convenient mid-ship bait tank system. The bait tank system has various plumbing options, all self-priming.")
product8 = Product.create!(:length => 172, :name => "Stealth 14", :product_type => 'kayak', :weight => 1360, :width => 33, :manufacturer_id => man1.id, :capacity => 8800, :description => "The Stealth 14 offers our brand new patented casting platform and center live well storage system. This 3 hatch center deck offers extra storage capacity and convenient mid-ship bait tank system. Various plumbing options, all are self-priming.")
product9 = Product.create!(:length => 150, :name => "Fish-n-Dive", :product_type => 'kayak', :weight => 1120, :width => 36, :manufacturer_id => man2.id, :capacity => 9600, :description => "The Cobra design team decided to combine a modified deck with the stable hull design of the Tandem and create the Cobra Fish n Dive multi-platform fishing kayak. Ideal for day fishing the kayak features one centrally located seat and a smaller reverse companion jump seat near the bow for another passenger or additional gear. There is no other kayak on the market this size that offers as much storage space. A large well is located in the stern and holds up to three tanks. Scuba divers love this unique arrangement that allows for heavy loads and provides a stable exit and re-entry platform.")

#Product Images
malibu_kayak_image_root = "/public/images/kayaks/malibu"
cobra_kayak_image_root = "/public/images/kayaks/cobra"
#Malibu kayak main images
#Image.create!(:file=>File.open(File.join(Rails.root, "#{malibu_kayak_image_root}/sierra10/sierra10_3quarter.jpg")), :model=>"Product", :model_id=>product1.id, :tag=>"main", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{malibu_kayak_image_root}/mini_x/minix_3quarter.jpg")), :model => "Product", :model_id => product2.id, :tag => "main", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{malibu_kayak_image_root}/pro_explorer/proexplorer_3quarter.jpg")), :model => "Product", :model_id => product3.id, :tag => "main", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{malibu_kayak_image_root}/x_factor/xfactor_3quarter.jpg")), :model => "Product", :model_id => product4.id, :tag => "main", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{malibu_kayak_image_root}/x_13/x13_3quarter.jpg")), :model => "Product", :model_id => product5.id, :tag => "main", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{malibu_kayak_image_root}/pro2_tandem/pro2tandem_3quarter.jpg")), :model => "Product", :model_id => product6.id, :tag => "main", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{malibu_kayak_image_root}/stealth_12/stealth12_3quarter.jpg")), :model => "Product", :model_id => product7.id, :tag => "main", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{malibu_kayak_image_root}/stealth_14/stealth14_3quarter.jpg")), :model => "Product", :model_id => product8.id, :tag => "main", :caption => "")
#Cobra kayak main images
#Image.create!(:file => File.open(File.join(Rails.root, "#{cobra_kayak_image_root}/fish_n_dive/fishndive_3quarter.jpg")), :model => "Product", :model_id => product9.id, :tag => "main", :caption => "")

#Trips
trip1 = Trip.create!(:name => "Irongate to Springwood", :mileage => 31.07, :waterbody_id => james_river.id, :start_date => "2009-07-18", :end_date => "2009-07-19", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id], "kayak" => [product7.id, product5.id, product4.id]}, :description => "We decided on the larger boats because we had a lot of gear to pack for the overnight trip. The kayaks swallowed all the gear in the picture below with room for more. We had enough room that we didn't have to scrimp on creature comforts, and were able to bring camp chairs, a gas stove, and even a fan for the tent. This is the first overnight trip we did and so we packed perhaps a little bit more than we needed, but we still had room for more. Everything that we couldn't fit inside the kayaks (or didn't want to), we could easily strap down to the kayaks using the multiple eyes and hooks to keep all our gear secure. Our gear that we didn't need access to while on the water mostly went in the fore and aft hatches, and for the most part stayed dry where it was. Tom swamped his boat once in some rapids and tested the X-13's ability to keep everything in the front hatch dry. Amazingly, the gear stayed mostly dry, even though the boat took on some water that we had to pump out with a hand bilge. The X Factor and Stealth 12 were able to stay more bouyant in the rapids and didn't ever take on as much water. As of this writing we have traveled most of the rapids in the river, including the class III at Balcony Falls above Lynchburg, and the X Factor has never needed to be pumped out, despite carrying Jasons' 225 pound frame and all the camping gear, cooler, fishing gear etc. The Stealth 12 has only needed to be pumped out once or twice. Brian and Jason liked having the center hatch on the Stealth and X Factor, which made accessing snacks, sunscreen, maps, and other things you need handy easy and convenient. With fishing rod holders positioned conveniently right behind the seat on either side, it was easy to switch between paddles and fishing rods when coming up on rapids or just after rapids to fish the eddies.")
trip2 = Trip.create!(:name => "Springwood to Snowden", :mileage => 30.9, :waterbody_id=>james_river.id, :start_date=>"2009-09-19",:end_date=>"2009-09-20", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id], "kayak" => [product7.id, product5.id, product4.id]},:description=>"To anyone taking out or launching at Springwood: You need to have some sort of kayak cart to carry your boat up or down at this landing. The parking lot is a ways above the river and the path to the river is steep and gravel. If you don't have a cart, you'll need friends and you may have to go up and down several times. Old Dominion Kayaks recommends the C-Tug for it's rugged durability, large knobby tires and ability to breakdown and store in your kayak. Check it out here, and don't forget to scroll down and watch the video demonstrating its features. Once again, we went with the big boats because of all the gear we needed to bring for the overnight trip. We've been on several trips now, and the boats that we rode in on this trip are becoming our favorites. Jason likes the stability and hauling capacity of the X Factor, Tom likes the speed of the X-13, and Brian likes the stability and speed found in the Stealth 12. This trip wasn't really any better for fishing than the Irongate to Springwood trip, it may have been a little worse actually. But you don't need to catch fish when you're surrounded by the beauty of a river coursing its way through the mountains. As close to fall as we were, some trees were starting to turn colors and dead leaves were floating down the river with us. Once again, spectacular mountain scenery. We wish we could have come back in a few weeks when most of the leaves had turned color, but it probably would have been too cold to do the kind of trip we did.")
trip3 = Trip.create!(:name => "Lynchburg to Bent Creek", :mileage => 29, :waterbody_id=>james_river.id, :start_date=>"2010-07-10",:end_date=>"2010-07-11", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id, michael.id], "kayak" => [product7.id, product5.id, product4.id, product3.id]}, :description => "This stretch of river was one that we signed up for as part of the James River Associations 3rd annual Runoff Rundown event. The event is a fundraiser meant to bring attention to the James River by having participants cover every section of the river in one day. We signed up for Lynchburg to Galts Mill. We caught a little bit of a break this weekend. The weather had been oppressively hot with 100+ degree days being the norm. Some rain had moved through and gave us cloud cover and only low-90s temperatures the first day. Sunday was also in the low 90's, but without the cloud cover. Certain stretches of the river seem to be a little bit prettier, or more interesting in the summertime when the water is lower and clear and you can see the rocky bottom and any fish between you and the bottom. This is definitely one of those stretches, although given the amount of dragging boats we had to do to get over all the shoals and ledges, we won't recommend doing this stretch in the summertime. This is definitely one where you'd want more water in the river, and hence probably a better trip in the spring. The water flow for these 2 days at Bent Creek was between 1200 and 1400 cfs, and the water gauge was around 3 feet. We would recommend you go when there's at least 4 feet or so of water, and avoid all the scrapeage and dragging boats over ledges. We weren't scraping the whole way, as there are definitely enough areas where you can paddle just fine, and several areas with deep holes for some bigger fish to hide in. We made about 19 miles the first day and camped at the head of an island. We often will try to do the majority of a 2-day trip the first day so when we get poor sleep, we won't have as much paddling to do the second day. We all actually slept fairly well on Saturday night though. Guess the investment in self-inflating air mattresses paid for itself. Brian and Tom caught several 10-14 inch smallies the first day while Michael and Jason just concerned themselves with paddling and relaxing. The second day, nobody spent much time fishing and we mostly just paddled and took a long lunch. ")
trip4 = Trip.create!(:name => "Bent Creek to Howardsville", :mileage => 27, :waterbody_id=>james_river.id,:start_date=>"2010-05-30", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id], "kayak" => [product7.id, product5.id, product4.id]}, :description=>"We already had this trip scheduled, so we decided to go ahead and go through with it, even though the river was a little bit high, and was definitely muddy. Looking at the lack of clarity in the water and how fast the water was moving, we put our fishing rods back in the truck and decided just to paddle. We had planned for an overnighter and packed our kayaks for one. We thought it would be cool to float up to and camp at the James River State Park, but it was way too early into the trip, and was way too early in the day when we got there. We didn't get much sleep the night before and weren't looking forward to a night of trying to sleep on the ground, so we just kept paddling, with an eye towards finishing in one day. We really didn't notice much on this trip, the way you might if you took more time. We made it to where we had planned on camping by lunchtime, so we definitely felt like it was worth trying to do all 27 miles in a single day, and so we did, and that's really about all there is to say about our trip on this section. We pretty much just made this trip all about making some mileage.")
trip5 = Trip.create!(:name => "Warren to Scottsville", :mileage => 6, :waterbody_id=>james_river.id,:start_date=>"2010-06-23", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id, michael.id, matthew.id, david.id, grandpa.id], "kayak" => [product7.id, product5.id, product4.id, product3.id, product2.id, product1.id, product7.id]}, :description=>"We had originally intended to do Howardsville to Scottsville this day, but the day before the trip we discovered that the landowner who leases the rights to the Howardsville landing and the commonwealth had not come to terms and been able to renew the contract allowing public use of the landing. So we scrambled to make something else happen and decided on Hardware River to Bremo Bluff, a section we had done before. We showed up at Hardware River in the morning to find that the bridge over the Hardware River was being rebuilt and would be completed in a couple of weeks. Plan C, we consulted our Gazetteer and found a little landing about half-way between Howardsville and Scottsville at Warrens Ferry. We had planned to be paddling this stretch of river because we wanted to paddle along-side the batteaus and June 23rd was the day the batteau festival was planning on traveling from Howardsville to Scottsville. We were able to get out on the river, albeit a little later than planned, and at least do a stretch we hadn't done before. We guess there were probably a lot of other folks on this stretch of river this day because of the batteau festival as well, but we've never seen so many people and boats on any other stretch of river. There was an odd feature on this strech that we haven't seen anywhere else on the river. A little ways below Warren there was an island in the middle of the river that seemed to be mostly a giant rock (30 foot tall or so) that had collected dirt and had trees grow up on it over time. It was pretty cool, and had a little ledge kind of hanging over a deep pool where people could jump off into the water below. Other than that, about the only other feature of note was Hatton's ferry. Hatton's fery is the last pole ferry in operation in the USA. Unfortunately we didn't get to see it in operation as we passed by. Not sure if it was because the water was too low or we just came by in between crossings. We were fortunate enough to be accompanied by the entire male side of the Lyles clan on this trip, or at least the Richmond group... that are older than 2. All of us have been out on the river with each other at some point, but never all of us together. A good time was had by all. ")
trip6 = Trip.create!(:name => "Scottsville to Bremo Bluff", :mileage => 12.84, :waterbody_id=>james_river.id,:start_date=>"2009-08-15", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id], "kayak" => [product7.id, product5.id, product3.id]}, :description=>"Scottsville to Hardware River WMA is supposed to be some of the best fishing on the James. We didn't pull in any whoppers, but we did do better than we have in other sections so far. Also, it was obvious there were a lot of fish through this stretch. Jason still didn't catch much, but was able to spot a lot of good size bass, gar and catfish in the water, including a huge school of 1.5'+ fish shortly after we launched. Late in the day we found a hole on the north bank with some carp the size of hogs. We couldn't entice them with anything, but it's just as well... they probably would have broken our rods. Along this stretch we saw some guys who had left their boat and were in the water noodling for giant cats. It must have been a good area for it, because Jason saw a dozen or so 15-pound+ catfish swimming near where they were. We were only able to hook into some smallmouths, none of the big fish. One great thing about this stretch that really makes it stand out from a lot of the river downstream is the amount of structure that exists for fish to hide in. There's a stretch of the river where there are a lot of islands that break up the trip and make for an interesting paddle. If you want the least amount of rapids, hug the river left all the way through this area. Taking the middle channel through the river there is a class III with a pinning rock at the end of the island chain that is best left alone if you're just interested in fishing. More experienced boaters that have highly maneuverable boats might enjoy it though. This is a great day trip from Richmond or Charlottesville. If you really want to fish and don't care about mileage, consider going from Scottsville to Hardware River WMA. Of the stretch we did, this first half of the trip has the best fishing. Having to go from Hardware to Bremo Bluff means less time fishing during the first half to make sure you're off the water by dark.")
trip7 = Trip.create!(:name => "Bremo Bluff to Columbia", :mileage => 9.8, :waterbody_id=>james_river.id,:start_date=>"2010-04-18", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id], "kayak" => [product7.id, product5.id, product4.id]},:description=>"It was a warm-ish spring day, and we were anxious to get going on doing more sections of the James River. This was our first outing of 2010, so we picked a short stretch that didn't have much in the way of rapids that might get us wet. This was a fairly unremarkable stretch for us. We didn't really attempt to fish much, even though we brought our rods with us. The only features on this stretch were a few small islands and 2-3 areas of riffles. This stretch also has long straight sections of the river, so there aren't a lot of natural place for trees to hang up on the banks and create good fishing holes. It was not the most exciting stretch, but was good to get out and back on the river. Probably the most exciting thing this trip was this old tank that's been in the river a while... long enough for someone to spray paint a smiley on it anyway.")
trip8 = Trip.create!(:name => "Columbia to West View", :mileage => 14, :waterbody_id=>james_river.id,:start_date=>"2009-06-07", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id, michael.id], "kayak" => [product7.id, product5.id, product4.id, product3.id]}, :description=>"We did this trip the day after we did Ancarrow's to Deep Bottom and we were exhausted from the day before. We chose this stretch to do on this day because the water west of Richmond was a little high and we would get an extra push from the river. We felt this was safe to do as there were no rapids on this stretch and the river is wide enough that a couple extra feet of water is not going to make a stretch like this one dangerous. Getting some help from the river was a welcome relief from fighting a rising tide like we did most of the previous day. As a result of being so worn out from the day before we didn't concern ourselves with getting to West View quickly, and spent much of the day just floating and talking. Since the river was muddy, we didn't spend any time trying to fish and were able to make good time. There's not really much to note on this stretch. There is a large island, Elk Island, that extends for about half the trip from Columbia to Cartersville. As the water was high, we didn't consider taking the left channel around the island as it is much narrower than the main channel, and was likely to be too quick from the high water. There isn't really much good structure on this stretch for fishing and the bends are long so there aren't good outside bends to catch trees and brush during high water. Another reason to paddle this stretch while the water is a little high and muddy... lousy fishing. About the only other thing of note on this stretch is the Willis River coming in a couple miles or so above the Cartersville landing on river right. We hadn't been doing much paddling up to where the Willis empties into the James, so we decided to paddle up it for a little bit. It seems like a nice river to explore some hot summer day, as all of where we explored had near-complete tree cover.")
trip9 = Trip.create!(:name => "Pony Pasture to Reedy Creek", :mileage => 3, :waterbody_id=>james_river.id,:start_date=>"2010-06-20", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id, michael.id], "kayak"=>[product1.id, product3.id, product2.id, product2.id]}, :description=>"This is a great stretch of river to do in just a few hours. Because of our proximity to Pony Pasture, we can pack up, drop off, run the trip and be home in a little over 3 hours. It has enough tame rapids in a short stretch to spend a Sunday afternoon playing around and getting a feel for how your boat handles. This wasn't our first time through this section, it was just the first time we went and took pictures. Plus Michael came with us again, instantly making it more noteworthy. We took the shorter boats because there are a lot of turns to be made on this stretch of river, and some of them need to be made quickly. There's only one stretch where you have to put much effort into paddling, the stretch below Pony Pasture until you get to Powhite ledges. The rest of the trip is a fun little trip with lots of rocks and islands and places to explore and play, and little rapids to keep your interest. Definitely one of our favorite stretches of the James, and a great quick trip most any time of year. One of the things that makes this stretch so interesting is how close together everything is. In this 3 miles, you pass under 3 bridges, are forced to cross back and forth across the river in order to follow the main channel, encounter low-lying dams, several fun rapids, water deep enough for jumping off of old railroad bridge pylons, are very likely to see bald eagles, herons and snakes, views of historic buildings, and plenty of rocks to stop and fish off of or to sunbathe. One could probably paddle through this stretch a dozen times picking your way through the various channels and not go the exact same way twice. Everything great about the river condensed into one 3-mile stretch.")
trip10 = Trip.create!(:name => "Reedy Creek to Ancarrows' Landing", :mileage => 3.03, :waterbody_id=>james_river.id,:start_date=>"2009-09-30",:paddler_kayak=>{"paddler"=>[brian.id,tom.id,jason.id],"kayak"=>[product2.id,product3.id,product2.id]},:description=>"For this stretch of river, we went with the shortest boats we had, because we weren't concerned with storage or fishing, we just needed the best maneuverability. Leading up to Belle Isle and after the 14th street bridge are calm waters, in between is anything but. We had no intention of running the class IV and V rapids in this stretch, so we chose safer routes and dragged our boats on rocks and over and around dams when we had to. This stretch isn't exactly the safest stretch of the river, and we won't recommend it to anyone who doesn't have a lot of experience on the river, even if you plan on avoiding all the big rapids. After we came up to the head of Belle Isle, we immediately headed towards the center of river left, where we figured would be the safest route. It was slow-going through here as it was a little chilly and we wanted to stay as dry as we could. So we picked our routes carefully to avoid rapids as much as possible. Other than taking a while to get through the section next to Belle Isle, we made it through without any incidents. After Belle Isle we made towards river right to avoid a rough section where an old dam had been busted up. We ended up having to pull our kayaks over a logjam and across the dam on the far right to avoid any rapids. Shortly after crossing this dam, we came up on a much more dangerous dam on river right, where we had to pull off the river entirely and pull our boats around the dam. After this portage, we put back on the river at the tail end of a class III and rode a wave train for a little bit towards the last of the rapids on the James River. We hadn't quite made it out of the rapids before Jason took his turn getting dumped into the river after getting pinned to a rock. At last, the end of the rapids, and the beginning of the tidal James. One interesting thing to note about this area is that crabs will come up from the Chesapeake Bay during the summer when the water is lower. It can be a little surprising the first time you look down and see a crab swimming in the rapids if you didn't know they came up as far as Richmond!")
trip11 = Trip.create!(:name => "Ancarrows' Landing to Deep Bottom", :mileage => 16.96, :waterbody_id=>james_river.id,:start_date=>"2009-06-06", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id, michael.id], "kayak" => [product7.id, product5.id, product4.id, product3.id]},:description=>"We've paddled several different sections of the river before, but this was the first section we did after deciding to paddle the entire river. Initially we had planned on making this an overnight and trying to get to Hopewell at the end of the second day, but decided last minute to just do a day paddle. It was a good thing too, because we were worn out after a day of battling the wind and rising tide for almost 17 miles, and looking forward to sleeping in our own beds instead of in a tent. This was our first experience in the tidal James and we weren't used to getting pushed back upstream when stopping to take a break. As you can imagine, the river is a lot more cluttered with junk through here than above Richmond. The stark contrast in the volume of garbage in the water and on the bank here vs. upstream is startling. Michael Lyles was able to join us on this trip and the trip the following day from Columbia to West View. Michael and Jason didn't concern themselves with fishing on this stretch of river. Tom and Brian did, but it was hardly worth their effort, reeling in only a few unimpressive smallmouth. The wildlife was limited to a few herons, a bald eagle and some of the black vultures that hang out at the Dutch Gap landing. This stretch has definitely been different than a lot of the other stretches we've done that have mostly been fairly remote, or at least felt remote. Here we passed by the port of Richmond, a lot of old barges, a power plant on the water at Dutch Gap, under the Pocahontas Parkway and the 295 Varina-Enon bridge, and past a marina at Osborne's Landing where all the guys with bass boats were putting in. Except for the stretch between a couple miles above Watkins Landing and Bosher's dam, there's hardly any motorized boat traffic upstream of Richmond, and that's all little jonboats. Here we were having to start paying closer attention to when we crossed from one side of the river to the other to avoid getting run over.")
trip12 = Trip.create!(:name => "Deep Bottom to Jordans' Point", :mileage => 11, :waterbody_id=>james_river.id,:start_date=>"2010-05-04", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id], "kayak" => [product7.id, product5.id, product4.id]}, :description=>"By now we don't have to stop and think about which boats we want to paddle anymore. We each are comfortable with our boats of choice, Stealth-12 for Brian, X-13 for Tom and X Factor for Jason. On this stretch, we started to appreciate the stability of the Malibu kayaks. From Hopewell to the bay, the river is significantly wider than before, and we will have to be worried about ocean-going boat traffic, their wakes and wind whipping up waves on the water. But it's not as bad as we thought it might be. We've all been a little apprehensive about paddling the bigger water east of Hopewell, but this stretch helped to allay our concerns. Paddling across the open water before the Benjamin Harrison bridge wasn't a big deal, especially since there was virtually no boat traffic on that Tuesday morning. Wildlife abounded on this stretch. In the morning, as we passed Jones Neck, the fish were constantly flopping out of the water and thrashing about in the shallows. We scared away plenty of deer that were feeding near the river bank, and there were several bald eagles. Osprey and blue heron nests also dotted buoys and trees along the bank, and we scared away a goose when we paddled right next to a hunting blind. Guess he knows hunting blinds are safe this time of year. :) At one point before the river got big we saw something pretty sizable breaching the water near the center channel. Jason went to go check it out, but whatever it was had stopped breaching by the time he got over there. We've heard that we might possibly see Atlantic sturgeon on the James, and were hopeful that we were seeing one, but didn't get a chance to confirm it. As the river gets wider and we get closer to Jamestown, we've started to see some plantations from the river, including Shirley Plantation, Virginia's oldest, (founded in 1616) and Appomattox Manor.")
trip13 = Trip.create!(:name => "Jordans' Point to Lawrence Lewis Jr Park", :mileage => 7, :waterbody_id=>james_river.id,:start_date=>"2010-10-03", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id], "kayak" => [product7.id, product5.id, product4.id]},:description=>"We were able to get one last trip in for the year on this windy October day. Brian and Tom paddled straight across the river right away to take advantage of the wind break offered by the trees on river left. Tom spent most of the trip hugging the shoreline to take maximum advantage. Jason stayed out in the middle some to try and get used to paddling in bigger water and not being right next to the shore. He paid for it by having to fight against the wind more. There was almost no boat traffic out on the river this day. We probably saw 2 boats all day. Usually, the interesting aspects of our trips have to do with our natural surroundings. This trip we were passing by some Virginia history, as we paddled past some of the historic James River Plantations. First we passed Berkeley Plantation, formerly known as Berkeley Hundred. We didn't really get a good picture from the water of the main house, but passed right next to some ruins of a replica of the ship Margaret that brought the original 38 settlers from England. Berkeley Plantation is available for tours. Learn more about the plantation here and here According to Wikipedia, the first Thanksgiving was held at Berkeley Plantation a full year before the Pilgrims came across on the Mayflower. Next down the river is Westover. The main house is pictured to the left. Westover was built in the early 1700's by William Byrd, the founder of Richmond. Learn more here. A little more paddling down the river and we reached our destination, Lawrence Lewis Jr. park. There isn't a landing at Lawrence Lewis, but there's a parking lot for a dock right by the water, so we were able to just pull our boats up over some rocks and right to the parking lot. Ahead of us lies one more river crossing as we cross from river left to river right. We plan to stay on river right all the way down to the James River bridge and utilize landings on river right the whole way down. Fortunately, this last crossing comes before the river gets miles wide.")
trip14 = Trip.create!(:name => "Route 33 to Route 54", :mileage => 6.65, :waterbody_id => south_anna.id, :start_date=>"2011-05-29", :paddler_kayak => {"paddler" => [tom.id, jason.id], "kayak" => [product5.id, product7.id]}, :description => "Since we really got into paddling, we've done most of our trips on the James. As we're getting closer to having paddled the entire James, we decided to start to branch out and try some other local rivers. This stretch of the South Anna was appealing because it has a few rapids to keep things interesting, it's close to home and the length of the trip is pretty short. We enjoyed this section enough that we did this trip 3 times in the summer of 2011. The first 2 times only Tom and Jason went. The 3rd time we were able to drag Brian along. The whole way, the river is pretty narrow, something we're definitely not used to. We have found this to be one of the better stretches we've been on for viewing wildlife. It helps that both banks are so close and even though there are some houses along the river, it's still very rural. We were able to paddle alongside some beavers and even saw some coyotes on the banks. Other than that, it was some of the usual wildlife; snakes, birds and deer. This is a very pretty stretch of river with a lot of little islands and small rapids to keep things interesting. One thing to keep an eye out for on such a narrow river is strainers. We came across some trees that had fallen across the river, and when the river is so narrow, they can easily reach from one bank to the other, making for sometimes difficult passage. Fortunately, none of the fallen trees we came across were in areas with rapids. We can definitely see doing this trip once a year or so, partly because of its convenience, partly because of how nice it is.")
trip15 = Trip.create!(:name => "Middle of the woods to Warrens Ferry on the James", :mileage => 15.5, :waterbody_id => rockfish.id, :start_date => "2011-07-08", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id], "kayak" => [product7.id, product5.id, product4.id]}, :description => "As part of paddling the entire James, we needed to do the stretch from Howardsville to Warren's Ferry. Since Howardsville had been closed to public access after we took out there on an earlier trip in 2010, we had to change our plans a bit. Fortunately, the Rockfish river empties into the James right at Howardsville, so we consulted www.virginiarivers.cloudaccess.net and found a little place we could put in at Schuyler. We put in at an unofficial landing that required a short walk down a hill and through some woods, definitely the least developed landing we've used, and one easily missed as there are no markings and no real indication you're in the right place. This is another narrow river where you can easily see any animals on either bank, including kingfishers, which we saw a number of. This stretch of the Rockfish is very pretty and peaceful with no real rapids to speak of, and other than the occasional car on the road that runs parallel to the river for a portion, it feels fairly remote. We were on the Rockfish for a total of about 9 miles before we got to the confluence with the James. After the Rockfish, paddling on the James felt a little bit boring, as we mostly just had to paddle and no longer had to watch out for the best path through rocks on a narrow river. There was one nice stretch of the James we went through where there was a good number of rocks and some rapids and islands to make things interesting again.")
trip16 = Trip.create!(:name => "Tylers' Beach to James River Bridge", :mileage => 12.35, :waterbody_id => james_river.id, :start_date => "2011-10-21", :paddler_kayak => {"paddler" => [brian.id, tom.id, jason.id], "kayak" => [product7.id, product5.id, product7.id]}, :description => "At this point in the year, we had only been able to get Tom, Brian and Jason together for 2 trips and we weren't making too much progress on finishing up the James so we decided to make our last trip of the year count towards finishing the James. At this point, everything we have left to do is in big, tidal water. Brian and Jason decided to take some old Pungos because they tend to cut through the water faster than the Malibu's and we were looking for a little bit extra speed. Unbeknownst to Brian, we had to be done in time to get back for his surprise 30th birthday party, so we needed the extra speed. We're not sure if using the Pungos was a mistake or not, because although we could paddle faster, we think the smaller, lighter boats might have bobbed a little more in the waves than our regular boats would have. Brian and Jason spent most of the day feeling seasick, while Tom did just fine in his X-13. It started out when we decided to cut across Burwell Bay to save some time and mileage. Our mileage for the day would end up being between 12 and 13 miles, but by the time we had gone across Burwell Bay and had only gone a few miles, Brian and Jason were having a hard time wanting to go any further. It wasn't a very windy day, but it was enough to make just enough chop to keep Brian and Jason's stomachs churning most of the day. After we crossed the bay, we hugged the shoreline the rest of the day, in part so we could keep getting out onto the firm ground, and take breaks from all the bobbing up and down. It was nice to see a different part of the James and see how the river continually changes from mountains to sea, but we could have done without the seasickness. We'll remember to take some dramamine for our next trips out in the big water. It probably didn't help our physical condition that we camped out the night before the trip (we never get enough sleep when camping) and that Tom made some strange concoction resembling food for breakfast the morning of this trip. Brian and Jason get seasick just remembering this trip, and are trying to forget whatever it is Tom made for breakfast.")

#Trip Images
james_river_image_root = "/public/images/trips/james_river"
south_anna_image_root = "/public/images/trips/south_anna"
rockfish_image_root = "/public/images/trips/rockfish"

##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/")),:model=>"Trip",:model_id=>,:tag=>"x",:caption=>"")
#Irongate to Springwood
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/irongate/CIMG2087.JPG")), :model => "Trip", :model_id =>trip1.id, :tag => "x", :caption => "This is all the stuff we managed to get into our kayaks for this trip. The Malibu kayaks handled it all with room to spare.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/irongate/CIMG2091.JPG")), :model => "Trip", :model_id =>trip1.id, :tag => "x", :caption => "Here we are all loaded up and ready to launch.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/irongate/CIMG2092.JPG")), :model => "Trip", :model_id =>trip1.id, :tag => "x", :caption => "Here we are at the head of the James in Iron Gate, all packed up and about to launch, pausing for our traditional pre-launch photo.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/irongate/CIMG2095.JPG")), :model => "Trip", :model_id =>trip1.id, :tag => "x", :caption => "Much of the trip we had views of the mountains surrounding us. Since we paddle mostly around Richmond, it was great to get a chance to paddle up in the mountains.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/irongate/CIMG2102.JPG")), :model => "Trip", :model_id =>trip1.id, :tag => "x", :caption => "Here Brian and Jason have lunch on a gravel bar on the first day. Looking downstream in anticipation of what's around the next bend.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/irongate/CIMG2112.JPG")), :model => "Trip", :model_id =>trip1.id, :tag => "x", :caption => "Tom (in the foreground) and Jason.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/irongate/CIMG2119.JPG")), :model => "Trip", :model_id =>trip1.id, :tag => "x", :caption => "We made camp on what would have been an island had there been more water in the river. Across from our psuedo-island camp we had a view of a rock face that the river flowed next to.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/irongate/CIMG2127.JPG")), :model => "Trip", :model_id =>trip1.id, :tag => "x", :caption => "Twenty minutes after we got going the second day, Jason got his line snagged while at the bottom of a mild rapid. Not reacting quickly enough, the rod got jerked from his hands. Here he's attempting to retrieve the rod from the bottom of the river. Yes, he got the rod, and yes, the water was really cold.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/irongate/CIMG2138.JPG")), :model=>"Trip",:model_id=>trip1.id,:tag=>"x",:caption=>"Brian tries for a muskie in this hole at a bend in the river. Virginia DGIF stocks the upper part of the James with muskie annually. We didn't catch any but did see one about 2 1/2 feet long.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/irongate/CIMG2146.JPG")), :model => "Trip", :model_id =>trip1.id, :tag => "x", :caption => "Brian comes in for a landing on a gravel bar where we had lunch on the 2nd day just below the remnants of an old bridge.")
#Springwood to Snowden
##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/")), :model => "Trip", :model_id =>trip2.id, :tag => "x", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/0919091642.jpg")), :model => "Trip", :model_id => trip2.id, :tag => "x", :caption => "Taking a break on an inside bend and enjoying the mountain views.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/0920091105.jpg")), :model => "Trip", :model_id => trip2.id, :tag => "x", :caption => "The weather was a bit overcast and chilly on the second day of this trip. Here we paddle toward some cloud cover.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/CIMG2341.JPG")), :model => "Trip", :model_id => trip2.id, :tag => "x", :caption => "Coming down the hill at Springwood, thankful for the C-Tug.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/CIMG2345.JPG")), :model => "Trip", :model_id => trip2.id, :tag => "x", :caption => "This is one of the few fish we managed to catch over the weekend. Here Tom displays perhaps the best fish he caught. Oh well, better luck next time.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/CIMG2359.JPG")), :model => "Trip", :model_id => trip2.id, :tag => "x", :caption => "Brian and Jason fish next to this small mountain town. Keep fishin' in vain, boys.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/CIMG2374.JPG")), :model => "Trip", :model_id => trip2.id, :tag => "x", :caption => "During lunch we had some visitors looking for handouts.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/CIMG2381.JPG")), :model => "Trip", :model_id => trip2.id, :tag => "x", :caption => "Here we're passing what appears to be a strip mine, one of the few unsightly things we've seen along the river.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/CIMG2387.JPG")), :model => "Trip", :model_id => trip2.id, :tag => "x", :caption => "About to pass under one of the many bridges we've been under while on the river. Jason tries to make sure he's the first to pass under each one.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/CIMG2399.JPG")), :model => "Trip", :model_id => trip2.id, :tag => "x", :caption => 'This is our "More bars in more places" moment on the river. Should AT & T be paying us for this plug?')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/CIMG2420.JPG")), :model => "Trip", :model_id => trip2.id, :tag => "x", :caption => "This picture is to give you an idea of just how rocky it is in the Balcony Falls area. It makes us very glad that we went when we did and not when the water was higher.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/CIMG2434.JPG")), :model => "Trip", :model_id => trip2.id, :tag => "x", :caption => "This picture was taken after we got off the river, and is from the road that winds through the mountains above the river. In the background is Balcony Falls.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/springwood/otters_below_the_maury.jpg")), :model => "Trip", :model_id => trip2.id, :tag => "x", :caption => "We couldn't get a real good picture of the otters. It was more entertaining to watch them than to try and get a good shot of them. There were 4 or 5 of them swimming and feeding together.")
#Lynchburg to Bent Creek
##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/lynchburg/")), :model => "Trip", :model_id =>trip3.id, :tag => "x", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/lynchburg/CIMG3427.JPG")), :model => "Trip", :model_id => trip3.id, :tag => "x", :caption => "After spending a few minutes jumping off a rope swing under 6-mile bridge, Jason remounts his kayak in style.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/lynchburg/IMG_0153.JPG")), :model => "Trip", :model_id => trip3.id, :tag => "x", :caption => "Here we are about to make our departure for 2 days of paddling the James River, posing for our traditional pre-launch photo.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/lynchburg/IMG_0161.JPG")), :model => "Trip", :model_id => trip3.id, :tag => "x", :caption => "Michael and Tom paddle next to downtown Lynchburg.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/lynchburg/IMG_0166.JPG")), :model => "Trip", :model_id => trip3.id, :tag => "x", :caption => "Michael and Jason approach 6-mile bridge. 6-mile bridge is named such because it is 6 miles downstream from Lynchburg. The bridge was originally constructed about 1853, with it's most recent incarnation dating back to 1957. The railroads haven't used the bridge in decades.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/lynchburg/IMG_0171.JPG")), :model => "Trip", :model_id => trip3.id, :tag => "x", :caption => "Tom shows off a smallie he caught. Brian and Tom were each able to pull in a few smallies 10-14 inches on the first day. Michael and Jason didn't bother with fishing and caught the same amount of fish they would have caught had they been trying. :)")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/lynchburg/IMG_0185.JPG")), :model => "Trip", :model_id => trip3.id, :tag => "x", :caption => "Here's our campsite for Saturday night. Although we only had a couple of options for placing our tents on this island, this was by far the best campsite we've had when camping on the river so far... other than bugs.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/lynchburg/IMG_0186.JPG")), :model => "Trip", :model_id => trip3.id, :tag => "x", :caption => "Jason tests out the stability of the X-Factor as he paddles through a class I rapid standing up. It's a good thing he didn't fall, considering he wasn't wearing his pfd through this stretch.")
#Bent Creek to Howardsville
##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/bent_creek/")), :model => "Trip", :model_id =>trip4.id, :tag => "x", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/bent_creek/IMG_0138.JPG")), :model => "Trip", :model_id => trip4.id, :tag => "x", :caption => "Here we are, packing our boats for launch. You can see in the background that the river is a little high and muddy.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/bent_creek/IMG_0144.JPG")), :model => "Trip", :model_id => trip4.id, :tag => "x", :caption => "One of the more interesting sights of the day, although seeing cows in the river up this way is fairly common.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/bent_creek/IMG_0152.JPG")), :model => "Trip", :model_id => trip4.id, :tag => "x", :caption => "Tom puts his head down and just paddles... looking for an end to the day...")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/bent_creek/IMG_0153.JPG")), :model => "Trip", :model_id => trip4.id, :tag => "x", :caption => "... And here's the end of a very long day, the takeout at Howardsville, just on the other side of the bridge on river left.")
#Warren to Scottsville
##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/warren/")), :model => "Trip", :model_id =>trip5.id, :tag => "x", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/warren/CIMG3256.JPG")), :model => "Trip", :model_id => trip5.id, :tag => "x", :caption => "Just chillin' in the water, waiting to launch. As close as we came to a pre-launch photo this time.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/warren/CIMG3262.JPG")), :model => "Trip", :model_id => trip5.id, :tag => "x", :caption => "Jim demonstrates the stability of the Stealth-12 casting platform.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/warren/CIMG3265.JPG")), :model => "Trip", :model_id => trip5.id, :tag => "x", :caption => "One of several batteaus we got to see this day.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/warren/CIMG3267.JPG")), :model => "Trip", :model_id => trip5.id, :tag => "x", :caption => "Jason tries to catch some live bait.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/warren/IMG_0155.JPG")), :model => "Trip", :model_id => trip5.id, :tag => "x", :caption => "Brian shows off one of the smallmouth he caught that day.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/warren/IMG_0159.JPG")), :model => "Trip", :model_id => trip5.id, :tag => "x", :caption => "It was a hot one that day, so we took an extended break under some shade trees.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/warren/IMG_0161.JPG")), :model => "Trip", :model_id => trip5.id, :tag => "x", :caption => "Michael takes a break from paddling to cast a line. Michael and Jason were the only 2 to not land a fish this trip, and they actually tried this time too.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/warren/IMG_0165.JPG")), :model => "Trip", :model_id => trip5.id, :tag => "x", :caption => "Michael and Tom work on packing up the gear after landing at Scottsville. It was a long day in the hot June sun.")
#Scottsville to Bremo Bluff
##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/scottsville/")), :model => "Trip", :model_id =>trip6.id, :tag => "x", :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/scottsville/0815091004.jpg")), :model => "Trip", :model_id => trip6.id, :tag => "x", :caption => "At the launch, Jason waits impatiently as Tom and Brian get their fishing rigs set up. Fairly confident that he won't catch anything, Jason grows antsy as he just wants to get on the river.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/scottsville/09 032.jpg")), :model => "Trip", :model_id => trip6.id, :tag => "x", :caption => 'Jason gets tired of waiting on Tom to launch. "So long suckers."')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/scottsville/09 045.jpg")), :model => "Trip", :model_id => trip6.id, :tag => "x", :caption => "Brian holds up one of the many little smallmouth he caught this day.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/scottsville/0815091116.jpg")), :model => "Trip", :model_id => trip6.id, :tag => "x", :caption => "Tom shows one of his many smallmouth from the day.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/scottsville/0815091735.jpg")), :model => "Trip", :model_id => trip6.id, :tag => "x", :caption => "Headed under some bridges.")
#Bremo Bluff to Columbia
##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/bremo_bluff/")), :model => "Trip", :model_id => trip7.id, :tag => "x", :caption => '')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/bremo_bluff/IMG_0880.JPG")), :model => "Trip", :model_id => trip7.id, :tag => "x", :caption => 'A random friendly dog joins us as we prepare to launch from Bremo Bluff.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/bremo_bluff/IMG_0882.JPG")), :model => "Trip", :model_id => trip7.id, :tag => "x", :caption => 'Someone thought this tank deserved a smiley painted on it. I agree')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/bremo_bluff/IMG_0883.JPG")), :model => "Trip", :model_id => trip7.id, :tag => "x", :caption => 'Another selling point for wearing pfds at all times... Jason slipped on some thin mud after stepping out of his kayak and went chest-first onto the rock we took a break on. The pfd broke the fall and Jason only hurt his pride.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/bremo_bluff/IMG_0886.JPG")), :model => "Trip", :model_id => trip7.id, :tag => "x", :caption => 'Looking upriver from a flat rock in the middle of the river where we took a quick break from paddling.')

#Columbia to West View
##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/columbia/")), :model => "Trip", :model_id => trip8.id, :tag => "x", :caption => '')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/columbia/kayak 09 007.jpg")), :model => "Trip", :model_id => trip8.id, :tag => "x", :caption => '	Brian takes a rest from paddling up the Willis River.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/columbia/kayak 09 031.jpg")), :model => "Trip", :model_id => trip8.id, :tag => "x", :caption => 'Jason tests the stability of the X-Factor by paddling the last half-mile or so of the trip standing up.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/columbia/kayak 09 054.jpg")), :model => "Trip", :model_id => trip8.id, :tag => "x", :caption => 'Posing for the traditional pre-launch photo.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/columbia/kayak 09 059.jpg")), :model => "Trip", :model_id => trip8.id, :tag => "x", :caption => 'While we were just floating along eating lunch, this butterfly came and joined us and hung out for a while.')
#Pony Pasture to Reedy Creek
##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/pony_pasture/")), :model => "Trip", :model_id => trip9.id, :tag => "x", :caption => '')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/pony_pasture/0620001702.jpg")), :model => "Trip", :model_id => trip9.id, :tag => "x", :caption => 'Choo-choo rapids. A good class II rapid. This is the first rapid we ever ran in the Malibu kayaks, on a trip in 2009. It looks a little intimidating to those not used to running rapids, but it\'s not that big a deal.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/pony_pasture/0620001704.jpg")), :model => "Trip", :model_id => trip9.id, :tag => "x", :caption => 'We brought the new Sierra 10 to try out on this section of the James River. It did well, with the short length making for tighter turns.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/pony_pasture/0620001704a.jpg")), :model => "Trip", :model_id => trip9.id, :tag => "x", :caption => 'Tom and Michael finish scouting choo-choo rapids and prepare to run it. It\'s always a good idea to scout rapids that you can\'t see all of, especially since recent floods can bring down trees and create hazards in the rapids. In this case, choo-choo bends towards river right just after a rock outcropping, so it\'s difficult to see the entire rapid from the water until you\'re almost committed to running it.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/pony_pasture/0620001716.jpg")), :model => "Trip", :model_id => trip9.id, :tag => "x", :caption => 'About to head under a log, because we could.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/pony_pasture/0620001720.jpg")), :model => "Trip", :model_id => trip9.id, :tag => "x", :caption => 'Jason leads Michael through a narrow passage at the end of a dam.')
#Reedy Creek to Ancarrows
##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/reedy/")), :model => "Trip", :model_id => trip10.id, :tag => "x", :caption => '')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/reedy/0930091553a.jpg")), :model => "Trip", :model_id => trip10.id, :tag => "x", :caption => 'Here we are at Reedy Creek launch, packing up and about to go.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/reedy/0930091603.jpg")), :model => "Trip", :model_id => trip10.id, :tag => "x", :caption => 'Here Tom and Jason cruise towards the head of Belle Isle contemplating their impending doom in the vicious waters on the north side of the island.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/reedy/0930091622.jpg")), :model => "Trip", :model_id => trip10.id, :tag => "x", :caption => 'Jason scouts ahead, trying to pick the best path through the rapids.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/reedy/0930091622b.jpg")), :model => "Trip", :model_id => trip10.id, :tag => "x", :caption => 'Tom takes a break while working his way through the rapids. In the background is Hollywood cemetery, where the rapids get their name from.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/reedy/0930091734.jpg")), :model => "Trip", :model_id => trip10.id, :tag => "x", :caption => 'Passing by Richmond.')
#Ancarrows to Deep Bottom
##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/ancarrows/")), :model => "Trip", :model_id => trip11.id, :tag => "x", :caption => '')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/ancarrows/kayak 09 023.jpg")), :model => "Trip", :model_id => trip11.id, :tag => "x", :caption => 'Brian, Jason and Michael pose for the traditional pre-launch photo op.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/ancarrows/kayak 09 029.jpg")), :model => "Trip", :model_id => trip11.id, :tag => "x", :caption => 'Brian, Jason and Michael, just paddling along.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/ancarrows/kayak 09 033.jpg")), :model => "Trip", :model_id => trip11.id, :tag => "x", :caption => 'Welcome to Richmond! We weren\'t able to determine what this was for. We assume at some point passengers were loaded/unloaded here.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/ancarrows/kayak 09 038.jpg")), :model => "Trip", :model_id => trip11.id, :tag => "x", :caption => 'Michael pulls into the port of Richmond. It was a Saturday, so we didn\'t have to worry about any ocean-going traffic today.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/ancarrows/kayak 09 048.jpg")), :model => "Trip", :model_id => trip11.id, :tag => "x", :caption => 'Michael pauses under the Pocahontas Parkway to ponder his place in the universe.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/ancarrows/kayak 09 050.jpg")), :model => "Trip", :model_id => trip11.id, :tag => "x", :caption => 'Jason and Michael pose in front of a power plant that\'s right on the river.Make sure you stay on the opposite side of the river from the power plant.It looks like if you get too close you might get sucked in and end up helping to cool the power plant. Of course, there are warning signs.')
#Deep Bottom to Jordans Point
##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/deep_b/")), :model => "Trip", :model_id => trip12.id, :tag => "x", :caption => '')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/deep_b/img1.jpg")), :model => "Trip", :model_id => trip12.id, :tag => "x", :caption => 'Jason hangs out in front of a plantation.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/deep_b/img2.jpg")), :model => "Trip", :model_id => trip12.id, :tag => "x", :caption => 'Taking flight.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/deep_b/img3.jpg")), :model => "Trip", :model_id => trip12.id, :tag => "x", :caption => 'Brian gives a barge a wide berth.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/deep_b/img4.jpg")), :model => "Trip", :model_id => trip12.id, :tag => "x", :caption => 'As the river gets wider, we start to encounter different terrain than what we\'ve experienced before this trip.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/deep_b/IMG_0138.JPG")), :model => "Trip", :model_id => trip12.id, :tag => "x", :caption => 'Posing for the traditional pre-launch photo.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/deep_b/IMG_0147.JPG")), :model => "Trip", :model_id => trip12.id, :tag => "x", :caption => 'Mmmmm...... Hopewell.... smell the industrial goodness.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/deep_b/IMG_0150.JPG")), :model => "Trip", :model_id => trip12.id, :tag => "x", :caption => 'Our goal for the day, the Benjamin Harrison Memorial Bridge. Jordans\' Point marina is just on the other side of the bridge on river right.')
#Jordans Point to Lawrence Lewis.
##Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/jordans/")), :model => "Trip", :model_id => trip13.id, :tag => "x", :caption => '')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/jordans/CIMG3510.JPG")), :model => "Trip", :model_id => trip13.id, :tag => "x", :caption => 'About to launch, with the Benjamin Harrison Memorial bridge behind us.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/jordans/CIMG3513.JPG")), :model => "Trip", :model_id => trip13.id, :tag => "x", :caption => 'Masts of a replica of the ship Margaret that brought 38 settlers to Berkeley Hundred in 1619. Not sure if there used to be a full replica that was neglected, or if only the masts were replicated.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/jordans/CIMG3517.JPG")), :model => "Trip", :model_id => trip13.id, :tag => "x", :caption => 'Here we pass by the Westover Plantation House.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/jordans/CIMG3519.JPG")), :model => "Trip", :model_id => trip13.id, :tag => "x", :caption => 'Passing by the mouth of Herring Creek.')

#Tylers Beach to James River Bridge
##Image.create!(:file=>File.open(File.join(Rails.root,"#{james_river_image_root}/tylers_beach")),:model=>"Trip",:model_id=>trip16.id,:tag=>'x',:caption=>"")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/tylers_beach/1289.JPG")), :model => "Trip", :model_id => trip16.id, :tag => 'x', :caption => 'Our boats lined up by the water, waiting for us to finish packing and get launched.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/tylers_beach/1290.JPG")), :model => "Trip", :model_id => trip16.id, :tag => 'x', :caption => 'Tom and Jason pose for the traditional pre-launch photo.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/tylers_beach/1295.JPG")), :model => "Trip", :model_id => trip16.id, :tag => 'x', :caption => "Brian and Jason try to recover from having just crossed Burwell Bay. Our stomachs were not doing well after all that bobbing.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/tylers_beach/1297.JPG")), :model => "Trip", :model_id => trip16.id, :tag => 'x', :caption => 'After lunch, Brian tries to recuperate. The waves were pretty small at this point, but pur stomachs never quite did get over the bigger stuff in Burwell Bay.')
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/tylers_beach/1300.JPG")), :model => "Trip", :model_id => trip16.id, :tag => 'x', :caption => "Taking another break from paddling. Our target for the day is the bridge in the background on the left side of the photo.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/tylers_beach/1302.JPG")), :model => "Trip", :model_id => trip16.id, :tag => 'x', :caption => "Jason and Brian take their last 'Wish I could puke' break of the day.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{james_river_image_root}/tylers_beach/1303.JPG")), :model => "Trip", :model_id => trip16.id, :tag => 'x', :caption => "Our destination for the day, the James River Bridge. We took out on river right, just after the bridge. It was somewhat disheartening to feel as bad as we did and be able to see the bridge many miles before we actually reached it.")

#South Anna
#Route 33 to Route 54
##Image.create!(:file=>File.open(File.join(Rails.root,"#{south_anna_image_root}/route33_to_route54/")),:model=>"Trip",:model_id=>trip14.id,:tag=>'x',:caption=>"")
#Image.create!(:file => File.open(File.join(Rails.root, "#{south_anna_image_root}/route33_to_route54/1178.JPG")), :model => "Trip", :model_id => trip14.id, :tag => 'x', :caption => "Jason unwittingly poses for the traditional pre-launch photo.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{south_anna_image_root}/route33_to_route54/1187.JPG")), :model => "Trip", :model_id => trip14.id, :tag => 'x', :caption => "A lot of the first 2/3 of this stretch of river is kinda like this, little bits of rapids and some little chunks of flatwater paddling between.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{south_anna_image_root}/route33_to_route54/1190.JPG")), :model => "Trip", :model_id => trip14.id, :tag => 'x', :caption => "Jason cruises along looking for wildlife on the banks.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{south_anna_image_root}/route33_to_route54/1193.JPG")), :model => "Trip", :model_id => trip14.id, :tag => 'x', :caption => "There are also plenty of areas like this on the river, where there are trees partially down in the water and low-hanging branches. It all made for a very enclosed feeling.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{south_anna_image_root}/route33_to_route54/1199.JPG")), :model => "Trip", :model_id => trip14.id, :tag => 'x', :caption => "Jason paddles through the only place he could, under some low branches and around a downed tree.")

#Rockfish
#Schuyler to Warren
##Image.create!(:file => File.open(File.join(Rails.root, "#{rockfish_image_root}/schuyler_to_warren/")), :model => "Trip", :model_id => trip15.id, :tag => 'x', :caption => "")
#Image.create!(:file => File.open(File.join(Rails.root, "#{rockfish_image_root}/schuyler_to_warren/1228.JPG")), :model => "Trip", :model_id => trip15.id, :tag => 'x', :caption => "Jason approaches some class I rapids near the beginning of our trip on the Rockfish.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{rockfish_image_root}/schuyler_to_warren/1232.JPG")), :model => "Trip", :model_id => trip15.id, :tag => 'x', :caption => "Brian and Jason work their way around some grass, towards some small rapids.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{rockfish_image_root}/schuyler_to_warren/1234.JPG")), :model => "Trip", :model_id => trip15.id, :tag => 'x', :caption => "Brian brought along his GoPro camera on this trip. Here he prepares to shoot some video.")
#Image.create!(:file => File.open(File.join(Rails.root, "#{rockfish_image_root}/schuyler_to_warren/1237.JPG")), :model => "Trip", :model_id => trip15.id, :tag => 'x', :caption => "Tom takes a break from paddling and fishes a bit.")

#Colors
color_red = Color.create!(:name => "red", :description => 'e93939')
color_white = Color.create!(:name => "white", :description => 'ffffff')
color_gray_granite = Color.create!(:name => "gray granite", :description => 'a8aaa7')
color_blue = Color.create!(:name => "blue", :description => '436ece')
color_yellow = Color.create!(:name => "yellow", :description => 'f3d711')
color_lime_green = Color.create!(:name => "lime green", :description => '99cf00')
color_mango_orange = Color.create!(:name => "mango orange", :description => 'fd9724')
color_hunter_green = Color.create!(:name => "hunter green", :description => '51684a')
color_sand = Color.create!(:name => "sand", :description => 'c4b582')
color_stone_gray = Color.create!(:name => "stone gray", :description => 'b1b1b1')
color_olive = Color.create!(:name => "olive", :description => '507642')
color_red_yellow = Color.create!(:name => "red/yellow", :description => 'ffffff')
color_lime_yellow = Color.create!(:name => "lime/yellow", :description => 'ffffff')
color_orange_yellow = Color.create!(:name => "orange/yellow", :description => 'ffffff')

#ProductColors
#Cobra Fish-n-Dive
ProductColor.create!(:color_id => color_white.id,:product_id => product9.id)
ProductColor.create!(:color_id => color_lime_green.id, :product_id => product9.id)
ProductColor.create!(:color_id => color_stone_gray.id, :product_id => product9.id)
ProductColor.create!(:color_id => color_yellow.id, :product_id => product9.id)
ProductColor.create!(:color_id => color_olive.id, :product_id => product9.id)
ProductColor.create!(:color_id => color_red_yellow.id, :product_id => product9.id)
ProductColor.create!(:color_id => color_lime_yellow.id, :product_id => product9.id)
ProductColor.create!(:color_id => color_orange_yellow.id, :product_id => product9.id)

#Sierra 10
ProductColor.create!(:color_id => color_gray_granite.id,:product_id => product1.id)
ProductColor.create!(:color_id => color_hunter_green.id, :product_id => product1.id)
ProductColor.create!(:color_id => color_red.id, :product_id => product1.id)
ProductColor.create!(:color_id => color_sand.id, :product_id => product1.id)
ProductColor.create!(:color_id => color_yellow.id, :product_id => product1.id)
#Mini-X
ProductColor.create!(:color_id => color_white.id, :product_id => product2.id)
ProductColor.create!(:color_id => color_gray_granite.id, :product_id => product2.id)
ProductColor.create!(:color_id => color_blue.id, :product_id => product2.id)
ProductColor.create!(:color_id => color_yellow.id, :product_id => product2.id)
ProductColor.create!(:color_id => color_red.id, :product_id => product2.id)
ProductColor.create!(:color_id => color_lime_green.id, :product_id => product2.id)
ProductColor.create!(:color_id => color_mango_orange.id, :product_id => product2.id)
#PX
ProductColor.create!(:color_id => color_white.id, :product_id => product3.id)
ProductColor.create!(:color_id => color_gray_granite.id, :product_id => product3.id)
ProductColor.create!(:color_id => color_blue.id, :product_id => product3.id)
ProductColor.create!(:color_id => color_yellow.id, :product_id => product3.id)
ProductColor.create!(:color_id => color_hunter_green.id, :product_id => product3.id)
ProductColor.create!(:color_id => color_red.id, :product_id => product3.id)
ProductColor.create!(:color_id => color_lime_green.id, :product_id => product3.id)
ProductColor.create!(:color_id => color_mango_orange.id, :product_id => product3.id)
#XFactor
ProductColor.create!(:color_id => color_white.id, :product_id => product4.id)
ProductColor.create!(:color_id => color_gray_granite.id, :product_id => product4.id)
ProductColor.create!(:color_id => color_blue.id, :product_id => product4.id)
ProductColor.create!(:color_id => color_yellow.id, :product_id => product4.id)
ProductColor.create!(:color_id => color_red.id, :product_id => product4.id)
ProductColor.create!(:color_id => color_lime_green.id, :product_id => product4.id)
ProductColor.create!(:color_id => color_mango_orange.id, :product_id => product4.id)
#X13
ProductColor.create!(:color_id => color_red.id, :product_id => product5.id)
ProductColor.create!(:color_id => color_lime_green.id, :product_id => product5.id)
ProductColor.create!(:color_id => color_mango_orange.id, :product_id => product5.id)
ProductColor.create!(:color_id => color_yellow.id, :product_id => product5.id)
ProductColor.create!(:color_id => color_stone_gray.id, :product_id => product5.id)
#P2T
ProductColor.create!(:color_id => color_white.id, :product_id => product6.id)
ProductColor.create!(:color_id => color_gray_granite.id, :product_id => product6.id)
ProductColor.create!(:color_id => color_blue.id, :product_id => product6.id)
ProductColor.create!(:color_id => color_yellow.id, :product_id => product6.id)
ProductColor.create!(:color_id => color_red.id, :product_id => product6.id)
ProductColor.create!(:color_id => color_lime_green.id, :product_id => product6.id)
ProductColor.create!(:color_id => color_mango_orange.id, :product_id => product6.id)
#Stealth12
ProductColor.create!(:color_id => color_red.id, :product_id => product7.id)
ProductColor.create!(:color_id => color_lime_green.id, :product_id => product7.id)
ProductColor.create!(:color_id => color_mango_orange.id, :product_id => product7.id)
ProductColor.create!(:color_id => color_yellow.id, :product_id => product7.id)
ProductColor.create!(:color_id => color_stone_gray.id, :product_id => product7.id)
ProductColor.create!(:color_id => color_blue.id, :product_id => product7.id)
ProductColor.create!(:color_id => color_sand.id, :product_id => product7.id)
#Stealth14
ProductColor.create!(:color_id => color_red.id, :product_id => product8.id)
ProductColor.create!(:color_id => color_lime_green.id, :product_id => product8.id)
ProductColor.create!(:color_id => color_mango_orange.id, :product_id => product8.id)
ProductColor.create!(:color_id => color_yellow.id, :product_id => product8.id)
ProductColor.create!(:color_id => color_stone_gray.id, :product_id => product8.id)
ProductColor.create!(:color_id => color_blue.id, :product_id => product8.id)
ProductColor.create!(:color_id => color_sand.id, :product_id => product8.id)

#Product Versions
#Cobra Fish-n-Dive
fish_n_dive_base = Version.create!(:base_version => true, :manufacturer_id => man2.id, :name => "Fish-n-Dive", :price => 999, :product_id => product9.id, :description => "The Cobra design team decided to combine a modified deck with the stable hull design of the Tandem and create the Cobra Fish n Dive multi-platform fishing kayak. Ideal for day fishing the kayak features one centrally located seat and a smaller reverse companion jump seat near the bow for another passenger or additional gear. There is no other kayak on the market this size that offers as much storage space. A large well is located in the stern and holds up to three tanks. Scuba divers love this unique arrangement that allows for heavy loads and provides a stable exit and re-entry platform. ")
#Sierra10
sierra10_base = Version.create!(:base_version => true, :manufacturer_id => man1.id, :name => "Recreation", :price => 549, :product_id => product1.id, :description => "Malibu's 'All New' sit-inside style kayak offers the best of both worlds. A large rear well storage area, two flush mount rod holders along with various mounting areas for rod holders, fish finders, GPS systems and more.")
#Mini-X
mini_x_rec = Version.create!(:base_version => true, :manufacturer_id => man1.id, :name => "Recreation", :price => 569, :product_id => product2.id, :description => "The Mini-X Recreation version is a great entry-level boat. It has everything you need to get started kayaking today.")
mini_x_fd = Version.create!(:manufacturer_id => man1.id, :name => "Fish & Dive", :price => 649, :product_id => product2.id, :description => "The Mini-X Fish & Dive has everything the Recreation has plus 8\" Round Front Hatch w/Bucket and 2 Front Rod Holders.")
#Pro Explorer
px_rec = Version.create!(:manufacturer_id => man1.id, :base_version => true, :name => "Recreation", :price => 769, :product_id => product3.id, :description => "The Pro Explorer is designed for easy paddling, stability, fishing, diving, and is stackable for easy storage. It features dry seating, a cup holder, large storage capacity and molded multi-foot rests make getting comfortable easy for every paddler.")
px_fd = Version.create!(:manufacturer_id => man1.id, :name => "Fish & Dive", :price => 799, :product_id => product3.id, :description => "The Pro Explorer Fish & Dive has everything the Recreation has plus 2 rear rod holders.")
#X Factor
xfactor_rec = Version.create!(:manufacturer_id => man1.id, :base_version => true, :name => "Recreation", :price => 899, :product_id => product4.id, :description => "If you fish or dive Hard Core the 'All New' X-Factor can't be beat! The large front hatch can be upgraded with our new child seat... 'Gator Hatch'. Malibu Kayaks X-Factor is 'The Ultimate Fish & Dive Kayak '.")
xfactor_fd = Version.create!(:manufacturer_id => man1.id, :name => "Fish & Dive", :price => 999, :product_id => product4.id, :description => "The X Factor Fish & Dive includes everything the Recreation has, plus a 4-point rectangle rear hatch w/bag and 2 front and 2 rear rod holders.")
xfactor_rudder = Version.create!(:manufacturer_id => man1.id, :name => "Fish & Dive with rudder", :price => 1259, :product_id => product4.id, :description => "All of the features of the X Factor Fish & Dive, plus the Crack of Dawn rudder system installed. ($75 install fee applied)")
#X13
x13_rec = Version.create!(:manufacturer_id => man1.id, :name => "Recreation", :base_version => true, :price => 899, :product_id => product5.id, :description => "The Malibu Kayaks X-13 offers both speed and stability for a wide range of paddlers with a plethora of fishing ideas! Includes large bow storage, low profile Gator Hatch childs' seat, large center hatch with bag, side carry/paddle holders, large open rear well, rod holders with optional X-Wing Sliding Console.")
x13_fd = Version.create!(:manufacturer_id => man1.id, :name => "Fish & Dive", :price => 969, :product_id => product5.id, :description => "The X-13 Fish & Dive includes all of the features of the Recreation, plus 4 rear rod holders.")
x13_rudder = Version.create!(:manufacturer_id => man1.id, :name => "Fish & Dive with rudder", :price => 1219, :product_id => product5.id, :description => "All of the features of the X-13 Fish & Dive, plus the Crack of Dawn rudder system installed. ($75 install fee applied)")
#Pro 2 Tandem
p2_standard = Version.create!(:manufacturer_id => man1.id, :base_version => true, :name => "Standard", :price => 739, :product_id => product6.id, :description => "The Pro2 Tandem is the ultimate two-seater kayak. Designed for all-around ocean, lake and flatwater paddling, fishing and scuba diving, the Pro2 Tandem is exceptionally stable and easy to paddle for one person or two.")
p2_rec = Version.create!(:manufacturer_id => man1.id, :name => "Recreation", :price => 869, :product_id => product6.id, :description => "The Pro 2 Tandem Recreation includes all of the features of the Standard, plus 6-point rectangle center hatch and 8 inch round front hatch with bucket.")
p2_fd = Version.create!(:manufacturer_id => man1.id, :name => "Fish & Dive", :price => 1029, :product_id => product6.id, :description => "The Pro 2 Tandem Recreation includes all of the features of the Recreation, plus 8 inch round rear hatch with bucket and 6 rod holders.")
#Stealth 12
stealth12_fd = Version.create!(:manufacturer_id => man1.id, :base_version => true, :name => "Fish & Dive", :price => 999, :product_id => product7.id, :description => "The Stealth 12 is a smaller version of the Stealth 14, offering our brand new patented casting platform and center live well storage system. This 3-hatch center deck offers extra storage capacity and convenient mid-ship bait tank system. The bait tank system has various plumbing options, all self-priming.")
#Stealth 14
stealth14_fd = Version.create!(:manufacturer_id => man1.id, :base_version => true, :name => "Fish & Dive", :price => 1299, :product_id => product8.id, :description => "The Stealth 14 offers our brand new patented casting platform and center live well storage system. This 3 hatch center deck offers extra storage capacity and convenient mid-ship bait tank system. Various plumbing options, all are self-priming.")

#Product Features
#Malibu kayak Features
cup_holder = Feature.create!(:manufacturer_id => man1.id, :name => "Cup Holder", :description => "A great holder for cups.")
drain_plugs = Feature.create!(:manufacturer_id => man1.id, :name => "Drain plugs", :description => "Plug up the drain holes in your kayak, or open them up to let water drain out while you paddle.")
bow_stern_handles = Feature.create!(:manufacturer_id => man1.id, :name => "Bow & Stern handles", :description => "Flexible rubber handles for maximum comfort while carrying your kayak.")
side_carry_handles = Feature.create!(:manufacturer_id => man1.id, :name => "Side Carry handles", :description => "An extra set of handles to help you carry your kayak")
rectangle_center_hatch = Feature.create!(:manufacturer_id => man1.id, :name => "4 Point Rectangle Center Hatch w/Bag", :description => "Super convenient storage right where you need it, right in front of you.")
two_rear_rod_holders = Feature.create!(:manufacturer_id => man1.id, :name => "2 Rear Rod Holders", :description => "Convenient storage for your fishing rods, right behind you where you can easily get to them.")
eight_inch_round_front_hatch = Feature.create!(:manufacturer_id => man1.id, :name => "8 \" Round Front Hatch w/Bucket", :description => "Additional storage for your gear.")
two_front_rod_holders = Feature.create!(:manufacturer_id => man1.id, :name => "2 Front Rod Holders", :description => "For when you need more than 2 rods.")
standard_apex_deluxe_seat = Feature.create!(:manufacturer_id => man1.id, :name => "Apex 1 deluxe seat", :description => "Paddle in comfort all day with this thermally molded foam seat, offering 8-way adjustment, great support and padding.")
apex_deluxe_seat = Feature.create!(:manufacturer_id => man1.id, :name => "Apex 1 deluxe seat", :description => "Paddle in comfort all day with this thermally molded foam seat, offering 8-way adjustment, great support and padding.", :price => 100)
five_gallon_bait_bucket = Feature.create!(:manufacturer_id => man1.id, :name => "5 Gallon bait bucket w/pump", :description => "Throw your live bait in this bucket and keep it alive all day with the included pump.", :price => 90)
eight_inch_round_rear_hatch = Feature.create!(:manufacturer_id => man1.id, :name => "8 \" round rear hatch w/bucket", :description => "Even more storage to make your kayak the ultimate trip kayak", :price => 80)
x_wing_sliding_console = Feature.create!(:manufacturer_id => man1.id, :name => "X-Wing sliding console w/6\" battery storage (includes adapter kit)", :description => "The X-Wing is the ultimate kayak fishing accessory. It's a great place to mount your fishing electronics or simply a place to mount your rods. Includes battery storage.", :price => 129)
x_wing_sliding_console_electrical = Feature.create!(:manufacturer_id => man1.id, :name => "X-Wing sliding console w/3 switch electrical plate (includes adapter kit)", :description => "The X-Wing is the ultimate kayak fishing accessory. It's a great place to mount your fishing electronics or simply a place to mount your rods. Includes a 3 switch electrical plate.", :price => 150)
x_wing_adapter = Feature.create!(:manufacturer_id => man1.id, :name => "X-Wing adapter kit", :description => "Adapter kit for attaching an X-Wing to your kayak.", :price => 15)
bungee_tank_cord_and_hooks = Feature.create!(:manufacturer_id => man1.id, :name => "Bungee tank cord and hooks", :description => "Bungees designed for your kayak to work with existing mount points.")
front_hatch_with_strap = Feature.create!(:manufacturer_id => man1.id, :name => "Front hatch with strap", :description => "Storage up front with a strap to go over the hatch to hold it in place.")
four_point_center_hatch = Feature.create!(:manufacturer_id => man1.id, :name => "4-point rectangle center hatch with bag", :description => "This storage is in the most convenient place on the boat, right in front of you where you can easily access it. Secured by four points to keep it in place.")
deluxe_gator_hatch = Feature.create!(:manufacturer_id => man1.id, :name => "Deluxe Gator hatch (2 rod holders installed)", :description => "This great hatch has 2 rod holders installed and doubles as a child seat.", :price => 144)
trolling_motor_mount = Feature.create!(:manufacturer_id => man1.id, :name => "Trolling motor mount", :description => "On the back of the boat is a flat surface and 2 threaded bolt holes where you can mount a trolling motor")
adjustable_foot_track_system = Feature.create!(:manufacturer_id => man1.id, :name => "Adjustable foot track system", :description => "Adjust the pedals to whatever length suits you best. Each side is independently adjustable.")
trolling_motor_mount_option = Feature.create!(:manufacturer_id => man1.id, :name => "Trolling motor mount", :description => "On the back of the boat is a flat surface and 2 threaded bolt holes where you can mount a trolling motor", :price => 80)
custom_live_well_bait_tank = Feature.create!(:manufacturer_id => man1.id, :name => "Custom live well bait tank", :description => "A live well bait tank that was designed to work with your Malibu kayak.", :price => 90)
custom_live_well_pump_kit = Feature.create!(:manufacturer_id => man1.id, :name => "Custom love well pump kit", :description => "This custom live well pump kit was designed to work with the custom Malibu love well kit", :price => 90)
foot_rudder_installed = Feature.create!(:manufacturer_id => man1.id, :name => "Foot rudder system with mounting kit (installed)", :description => "This rudder system allows you to operate a rudder on the rear of your Malibu kayak with your feet. Flip the rudder down when you need it, flip it up when in shallow water.", :price => 145)
foot_rudder_system_option = Feature.create!(:manufacturer_id => man1.id, :name => "Foot rudder system with mounting kit", :description => "This rudder system allows you to operate a rudder on the rear of your Malibu kayak with your feet. Flip the rudder down when you need it, flip it up when in shallow water.", :price => 290)
foot_rudder_system = Feature.create!(:manufacturer_id => man1.id, :name => "Foot rudder system with mounting kit", :description => "This rudder system allows you to operate a rudder on the rear of your Malibu kayak with your feet. Flip the rudder down when you need it, flip it up when in shallow water.")
standard_gator_hatch = Feature.create!(:manufacturer_id => man1.id, :name => "Standard Gator Hatch", :description => "This great hatch doubles as a child seat.")
four_rear_rod_holders = Feature.create!(:manufacturer_id => man1.id, :name => "Four rear rod holders", :description => "Four rod holders in the rear, right where you can easily reach them.")
two_front_rod_holders_option = Feature.create!(:manufacturer_id => man1.id, :name => "2 Front Rod Holders", :description => "For when you need more than 2 rods.", :price => 30)
six_point_rectangle_hatch = Feature.create!(:manufacturer_id => man1.id, :name => "6-point rectangle center hatch", :description => "Center hatch between the 2 seats, includes 6 latches for a greater seal against water leakage")
six_rod_holders = Feature.create!(:manufacturer_id => man1.id, :name => "6 rod holders", :description => "Rod holders everywhere!")
large_live_well_bait_tank = Feature.create!(:manufacturer_id => man1.id, :name => "Large live well bait tank", :description => "A large live well that mounts where your center hatch would be.", :price => 114)
large_live_well_pump_kit = Feature.create!(:manufacturer_id => man1.id, :name => "Large live well pump kit", :description => "Pump kit to make the live well go.", :price => 85)
casting_platform = Feature.create!(:manufacturer_id => man1.id, :name => "Casting platform/center live well & storage", :description => "This feature of the Stealth series of boats makes it easy to stand in your kayak, and features a built-in live well to boot. Not fishing? Use the love well as dry storage.")
low_profile_gator_hatch = Feature.create!(:manufacturer_id => man1.id, :name => "Low profile Gator Hatch", :description => "This great hatch doubles as a child seat.")
#Cobra kayak features
large_hatch = Feature.create!(:manufacturer_id => man2.id, :name => "Large Hatch", :description => "Large 6-point hatch between your legs.")
o_hatch_with_bucket_and_tackle_box = Feature.create!(:manufacturer_id => man2.id, :name => "10 \" O hatch w/bucket & tackle box", :description => "This hatch is right where you need your live bait, right in front of you, between your legs.")
four_rod_holders = Feature.create!(:manufacturer_id => man2.id, :name => "Four rod holders", :description => "Two rod holders in front of you, and two behind you.")
transducer_scupper = Feature.create!(:manufacturer_id => man2.id, :name => "Transducer scupper", :description => "The transducer scupper is Plug-n-Play compatible with Lowrance & Eagle.")
jump_seat = Feature.create!(:manufacturer_id => man2.id, :name => "Jump seat", :description => "The jump seat is a perfect place to put your kids to bring them along for the ride.")
optional_backrest = Feature.create!(:manufacturer_id => man2.id, :name => "Backrest", :description => "Give your back a break while paddling all day.", :price => 1000)
optional_tank_straps = Feature.create!(:manufacturer_id => man2.id, :name => "Tank straps", :description => "Use your tank straps to secure your scuba gear for the ride out to your favorite spot.", :price => 1000)

#ProductFeatures
VersionFeature.create!(:feature_id => large_hatch.id, :version_id => fish_n_dive_base.id)
VersionFeature.create!(:feature_id => o_hatch_with_bucket_and_tackle_box.id, :version_id => fish_n_dive_base.id)
VersionFeature.create!(:feature_id => four_rod_holders.id, :version_id => fish_n_dive_base.id)
VersionFeature.create!(:feature_id => transducer_scupper.id, :version_id => fish_n_dive_base.id)
VersionFeature.create!(:feature_id => jump_seat.id, :version_id => fish_n_dive_base.id)
VersionFeature.create!(:feature_id => optional_backrest.id, :version_id => fish_n_dive_base.id)
VersionFeature.create!(:feature_id => optional_tank_straps.id, :version_id => fish_n_dive_base.id)

#Sierra10 Recreation
VersionFeature.create!(:feature_id => cup_holder.id, :version_id => sierra10_base.id)
VersionFeature.create!(:feature_id => adjustable_foot_track_system.id, :version_id => sierra10_base.id)
VersionFeature.create!(:feature_id => standard_apex_deluxe_seat.id, :version_id => sierra10_base.id)
VersionFeature.create!(:feature_id => bow_stern_handles.id, :version_id => sierra10_base.id)
VersionFeature.create!(:feature_id => bungee_tank_cord_and_hooks.id, :version_id => sierra10_base.id)
VersionFeature.create!(:feature_id => two_rear_rod_holders.id, :version_id => sierra10_base.id)

#Mini-X Recreation
VersionFeature.create!(:feature_id => cup_holder.id, :version_id => mini_x_rec.id)
VersionFeature.create!(:feature_id => drain_plugs.id, :version_id => mini_x_rec.id)
VersionFeature.create!(:feature_id => bow_stern_handles.id, :version_id => mini_x_rec.id)
VersionFeature.create!(:feature_id => side_carry_handles.id, :version_id => mini_x_rec.id)
VersionFeature.create!(:feature_id => rectangle_center_hatch.id, :version_id => mini_x_rec.id)
VersionFeature.create!(:feature_id => two_rear_rod_holders.id, :version_id => mini_x_rec.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => mini_x_rec.id)
VersionFeature.create!(:feature_id => five_gallon_bait_bucket.id, :version_id => mini_x_rec.id)
VersionFeature.create!(:feature_id => eight_inch_round_rear_hatch.id, :version_id => mini_x_rec.id)
VersionFeature.create!(:feature_id => x_wing_sliding_console.id, :version_id => mini_x_rec.id)
VersionFeature.create!(:feature_id => x_wing_adapter.id, :version_id => mini_x_rec.id)

#Mini-X F&D
VersionFeature.create!(:feature_id => eight_inch_round_front_hatch.id, :version_id => mini_x_fd.id)
VersionFeature.create!(:feature_id => two_front_rod_holders.id, :version_id => mini_x_fd.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => mini_x_fd.id)
VersionFeature.create!(:feature_id => five_gallon_bait_bucket.id, :version_id => mini_x_fd.id)
VersionFeature.create!(:feature_id => eight_inch_round_rear_hatch.id, :version_id => mini_x_fd.id)
VersionFeature.create!(:feature_id => x_wing_sliding_console.id, :version_id => mini_x_fd.id)
VersionFeature.create!(:feature_id => x_wing_adapter.id, :version_id => mini_x_fd.id)

#Pro Explorer Recreation
VersionFeature.create!(:feature_id => cup_holder.id,:version_id => px_rec.id)
VersionFeature.create!(:feature_id => drain_plugs.id,:version_id => px_rec.id)
VersionFeature.create!(:feature_id => bow_stern_handles.id, :version_id => px_rec.id)
VersionFeature.create!(:feature_id => side_carry_handles.id, :version_id => px_rec.id)
VersionFeature.create!(:feature_id => bungee_tank_cord_and_hooks.id, :version_id => px_rec.id)
VersionFeature.create!(:feature_id => front_hatch_with_strap.id, :version_id => px_rec.id)
VersionFeature.create!(:feature_id => four_point_center_hatch.id, :version_id => px_rec.id)
VersionFeature.create!(:feature_id => trolling_motor_mount.id, :version_id => px_rec.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => px_rec.id)
VersionFeature.create!(:feature_id => five_gallon_bait_bucket.id, :version_id => px_rec.id)
VersionFeature.create!(:feature_id => deluxe_gator_hatch.id, :version_id => px_rec.id)

#Pro Explorer Fish & Dive
VersionFeature.create!(:feature_id => two_rear_rod_holders.id, :version_id => px_fd.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => px_fd.id)
VersionFeature.create!(:feature_id => five_gallon_bait_bucket.id, :version_id => px_fd.id)
VersionFeature.create!(:feature_id => deluxe_gator_hatch.id, :version_id => px_fd.id)

# X Factor Rec
VersionFeature.create!(:feature_id => cup_holder.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => drain_plugs.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => bow_stern_handles.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => side_carry_handles.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => bungee_tank_cord_and_hooks.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => four_point_center_hatch.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => front_hatch_with_strap.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => adjustable_foot_track_system.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => trolling_motor_mount_option.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => x_wing_sliding_console.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => custom_live_well_bait_tank.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => custom_live_well_pump_kit.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => deluxe_gator_hatch.id, :version_id => xfactor_rec.id)
VersionFeature.create!(:feature_id => foot_rudder_system_option.id, :version_id => xfactor_rec.id)

#X Factor Fish & Dive
VersionFeature.create!(:feature_id => four_point_center_hatch.id, :version_id => xfactor_fd.id)
VersionFeature.create!(:feature_id => two_front_rod_holders.id, :version_id => xfactor_fd.id)
VersionFeature.create!(:feature_id => two_rear_rod_holders.id, :version_id => xfactor_fd.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => xfactor_fd.id)
VersionFeature.create!(:feature_id => trolling_motor_mount_option.id, :version_id => xfactor_fd.id)
VersionFeature.create!(:feature_id => x_wing_sliding_console.id, :version_id => xfactor_fd.id)
VersionFeature.create!(:feature_id => custom_live_well_bait_tank.id, :version_id => xfactor_fd.id)
VersionFeature.create!(:feature_id => custom_live_well_pump_kit.id, :version_id => xfactor_fd.id)
VersionFeature.create!(:feature_id => deluxe_gator_hatch.id, :version_id => xfactor_fd.id)
VersionFeature.create!(:feature_id => foot_rudder_system_option.id, :version_id => xfactor_fd.id)

#X Factor w/ Rudder
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => xfactor_rudder.id)
VersionFeature.create!(:feature_id => trolling_motor_mount_option.id, :version_id => xfactor_rudder.id)
VersionFeature.create!(:feature_id => x_wing_sliding_console.id, :version_id => xfactor_rudder.id)
VersionFeature.create!(:feature_id => custom_live_well_bait_tank.id, :version_id => xfactor_rudder.id)
VersionFeature.create!(:feature_id => custom_live_well_pump_kit.id, :version_id => xfactor_rudder.id)
VersionFeature.create!(:feature_id => deluxe_gator_hatch.id, :version_id => xfactor_rudder.id)
VersionFeature.create!(:feature_id => foot_rudder_system.id, :version_id => xfactor_rudder.id)

#X13 Rec
VersionFeature.create!(:feature_id => cup_holder.id, :version_id => x13_rec.id)
VersionFeature.create!(:feature_id => drain_plugs.id, :version_id => x13_rec.id)
VersionFeature.create!(:feature_id => bow_stern_handles.id, :version_id => x13_rec.id)
VersionFeature.create!(:feature_id => side_carry_handles.id, :version_id => x13_rec.id)
VersionFeature.create!(:feature_id => bungee_tank_cord_and_hooks.id, :version_id => x13_rec.id)
VersionFeature.create!(:feature_id => standard_gator_hatch.id, :version_id => x13_rec.id)
VersionFeature.create!(:feature_id => four_point_center_hatch.id, :version_id => x13_rec.id)
VersionFeature.create!(:feature_id => adjustable_foot_track_system.id, :version_id => x13_rec.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => x13_rec.id)
VersionFeature.create!(:feature_id => two_front_rod_holders_option.id, :version_id => x13_rec.id)
VersionFeature.create!(:feature_id => five_gallon_bait_bucket.id, :version_id => x13_rec.id)
VersionFeature.create!(:feature_id => x_wing_sliding_console.id, :version_id => x13_rec.id)

#X13 Fish & Dive
VersionFeature.create!(:feature_id => four_rear_rod_holders.id, :version_id => x13_fd.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => x13_fd.id)
VersionFeature.create!(:feature_id => two_front_rod_holders_option.id, :version_id => x13_fd.id)
VersionFeature.create!(:feature_id => five_gallon_bait_bucket.id, :version_id => x13_fd.id)
VersionFeature.create!(:feature_id => x_wing_sliding_console.id, :version_id => x13_fd.id)

#X13 F&D w rudder
VersionFeature.create!(:feature_id => foot_rudder_system.id, :version_id => x13_rudder.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => x13_rudder.id)
VersionFeature.create!(:feature_id => two_front_rod_holders_option.id, :version_id => x13_rudder.id)
VersionFeature.create!(:feature_id => five_gallon_bait_bucket.id, :version_id => x13_rudder.id)
VersionFeature.create!(:feature_id => x_wing_sliding_console.id, :version_id => x13_rudder.id)

#Pro2 Tandem Standard
VersionFeature.create!(:feature_id => drain_plugs.id, :version_id => p2_standard.id)
VersionFeature.create!(:feature_id => bow_stern_handles.id, :version_id => p2_standard.id)
VersionFeature.create!(:feature_id => bungee_tank_cord_and_hooks.id, :version_id => p2_standard.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => p2_standard.id)
VersionFeature.create!(:feature_id => large_live_well_bait_tank.id, :version_id => p2_standard.id)
VersionFeature.create!(:feature_id => large_live_well_pump_kit.id, :version_id => p2_standard.id)

#Pro2 Tandem Rec
VersionFeature.create!(:feature_id => six_point_rectangle_hatch.id, :version_id => p2_rec.id)
VersionFeature.create!(:feature_id => eight_inch_round_front_hatch.id, :version_id => p2_rec.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => p2_rec.id)
VersionFeature.create!(:feature_id => large_live_well_bait_tank.id, :version_id => p2_rec.id)
VersionFeature.create!(:feature_id => large_live_well_pump_kit.id, :version_id => p2_rec.id)

#Pro2 Fish & Dive
VersionFeature.create!(:feature_id => eight_inch_round_rear_hatch.id, :version_id => p2_fd.id)
VersionFeature.create!(:feature_id => six_rod_holders.id, :version_id => p2_fd.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => p2_fd.id)
VersionFeature.create!(:feature_id => large_live_well_bait_tank.id, :version_id => p2_fd.id)
VersionFeature.create!(:feature_id => large_live_well_pump_kit.id, :version_id => p2_fd.id)

#Stealth12 Fish & Dive
VersionFeature.create!(:feature_id => cup_holder.id, :version_id => stealth12_fd.id)
VersionFeature.create!(:feature_id => drain_plugs.id, :version_id => stealth12_fd.id)
VersionFeature.create!(:feature_id => bow_stern_handles.id, :version_id => stealth12_fd.id)
VersionFeature.create!(:feature_id => side_carry_handles.id, :version_id => stealth12_fd.id)
VersionFeature.create!(:feature_id => casting_platform.id, :version_id => stealth12_fd.id)
VersionFeature.create!(:feature_id => two_rear_rod_holders.id, :version_id => stealth12_fd.id)
VersionFeature.create!(:feature_id => low_profile_gator_hatch.id, :version_id => stealth12_fd.id)
VersionFeature.create!(:feature_id => adjustable_foot_track_system.id, :version_id => stealth12_fd.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => stealth12_fd.id)
VersionFeature.create!(:feature_id => x_wing_sliding_console.id, :version_id => stealth12_fd.id)
VersionFeature.create!(:feature_id => x_wing_sliding_console_electrical.id, :version_id => stealth12_fd.id)
VersionFeature.create!(:feature_id => foot_rudder_system_option.id, :version_id => stealth12_fd.id)
VersionFeature.create!(:feature_id => foot_rudder_installed.id, :version_id => stealth12_fd.id)

#Stealth14 Fish & Dive
VersionFeature.create!(:feature_id => cup_holder.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => drain_plugs.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => bow_stern_handles.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => side_carry_handles.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => casting_platform.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => two_rear_rod_holders.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => low_profile_gator_hatch.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => adjustable_foot_track_system.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => apex_deluxe_seat.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => x_wing_sliding_console.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => x_wing_sliding_console_electrical.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => foot_rudder_system_option.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => foot_rudder_installed.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => trolling_motor_mount_option.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => custom_live_well_bait_tank.id, :version_id => stealth14_fd.id)
VersionFeature.create!(:feature_id => custom_live_well_pump_kit.id, :version_id => stealth14_fd.id)