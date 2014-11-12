#! /bin/sh
# bots

# deploy command
# server="server.org" ;git add .; git commit -m "update";git push heroku master;heroku ps:scale web=1; curl -X POST ${server}/c2c -H "Content-Type: application/json" -d '{"action":"creategame","name":"hakaton","start":"2013-11-30 09:24:43.827522","end":"2013-12-01 09:24:43.827522"}'; echo;curl -X POST ${server}/c2c -H "Content-Type: application/json" -d '{"action":"creategame","name":"demo","start":"2013-11-30 09:24:43.827522","end":"2013-12-01 09:24:43.827522"}'; echo; curl -X POST  ${server}/games/ala -H "Content-Type: application/json" -d '{"uuid":"ala","latitude":5.45646,"longitude":4.0,"accuracy":2.0,"action":"subscribe","gamename":"demo"}'; echo; curl -X POST  ${server}/auth -H "Content-Type: application/json" -d '{"uuid":"ala1","latitude":5.45646,"longitude":4.0,"accuracy":2.0}'; echo
# git add .; git commit -m "update";git push heroku master;heroku ps:scale web=1; curl -X POST ${server}/c2c -H "Content-Type: application/json" -d '{"action":"creategame","name":"hakaton","start":"2013-11-30 09:24:43.827522","end":"2013-12-01 09:24:43.827522"}'; echo;curl -X POST ${server}/c2c -H "Content-Type: application/json" -d '{"action":"creategame","name":"demo","start":"2013-11-30 09:24:43.827522","end":"2013-12-01 09:24:43.827522"}';
#

server="server.org"

range=(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38)

lon_bot1=( 83.088750 83.089686 83.090735 83.091600 83.092238 83.092711 83.092979 83.093534 83.094399 83.094996 83.096107 83.097507 83.098577 83.100038 83.100944 83.102822 83.104150 83.105542 83.105510 83.105315 83.105089 83.104506 83.104635 83.104441 83.104409 83.104020 83.103955 83.103728 83.103340 83.103340 83.102627 83.101267 83.099972 83.099907 83.099875 83.100522 83.101559 83.102206 83.102368 83.102563 )

lat_bot1=( 54.835539 54.836006 54.836468 54.836089 54.835674 54.835247 54.835046 54.835472 54.835804 54.836326 54.836693 54.837238 54.836717 54.836776 54.836266 54.836934 54.837661 54.838351 54.837288 54.836523 54.835553 54.834826 54.833800 54.832457 54.831711 54.830872 54.830293 54.829472 54.828689 54.827849 54.827420 54.827831 54.827812 54.829249 54.830349 54.830983 54.831058 54.832233 54.833278 54.834639 )

lon_bot2=( 83.076390 83.082227 83.081495 83.081166 83.081002 83.080304 83.080756 83.082644 83.084573 83.085887 83.086339 83.086257 83.086626 83.086544 83.086298 83.085271 83.084040 83.082603 83.080920 83.080058 83.080427 83.080509 83.081330 83.082685 83.083875 83.085025 83.086339 83.087078 83.089048 83.090485 83.090895 83.090772 83.090608 83.089869 83.088596 83.087160 83.085641 83.084450 83.083424 83.082316 )
lat_bot2=( 54.881485 54.871114 54.870596 54.869816 54.868919 54.868139 54.867100 54.867548 54.867572 54.867714 54.867241 54.866462 54.865966 54.865469 54.864761 54.864099 54.863390 54.863579 54.863438 54.862823 54.862138 54.861571 54.860886 54.861689 54.862091 54.862634 54.863343 54.863627 54.864643 54.865091 54.866603 54.867359 54.868541 54.869178 54.869745 54.870336 54.870549 54.870832 54.870903 54.871115 )

lon_bot3=( 83.136472 83.134240 83.130120 83.126859 83.120336 83.115014 83.112096 83.112268 83.110379 83.108148 83.099393 83.095101 83.090467 83.085660 83.084630 83.089265 83.094415 83.099565 83.102311 83.106259 83.105916 83.106774 83.107804 83.110036 83.112439 83.117932 83.122396 83.127031 83.129090 83.131837 83.133554 83.138360 83.140935 83.146600 83.151406 83.154668 83.154325 83.154153 83.150891 83.149003 )
lat_bot3=( 54.872102 54.872399 54.871114 54.872399 54.872003 54.870621 54.866669 54.863903 54.860742 54.860149 54.857283 54.856987 54.859161 54.861532 54.865681 54.868151 54.869238 54.867855 54.866274 54.863706 54.860544 54.857185 54.854220 54.852639 54.849872 54.849477 54.848785 54.852837 54.855505 54.859062 54.860939 54.863607 54.864693 54.864397 54.865286 54.867460 54.870719 54.873090 54.874868 54.876942 )

lon_bot4=( 83.089780 83.090618 83.091182 83.092064 83.092998 83.093562 83.093809 83.094021 83.093192 83.092628 83.092011 83.092857 83.092663 83.092064 83.090883 83.090125 83.089314 83.088274 83.088186 83.088309 83.090195 83.091500 83.091059 83.090706 83.089719 83.089596 83.089772 83.090424 83.091553 83.092117 83.091535 83.090601 83.090125 83.089155 83.088979 83.088803 83.089191 83.089543 83.089843 83.090724 )
lat_bot4=( 54.830694 54.831675 54.831929 54.832437 54.832964 54.833218 54.833858 54.834305 54.834904 54.835452 54.835736 54.836843 54.837695 54.837675 54.837442 54.836944 54.837837 54.837766 54.838568 54.839340 54.839462 54.839198 54.838944 54.838629 54.837695 54.837005 54.836213 54.836132 54.836538 54.836305 54.835472 54.835492 54.835381 54.835035 54.834802 54.834254 54.833858 54.833360 54.832924 54.832731 )

lon_bot5=( 83.094587 83.093661 83.091578 83.092146 83.092241 83.091957 83.092241 83.092762 83.093661 83.094087 83.095697 83.097733 83.100527 83.102326 83.104599 83.107629 83.110044 83.111038 83.111180 83.112080 83.109191 83.107913 83.106114 83.104788 83.105498 83.107014 83.108197 83.109144 83.107203 83.105214 83.103557 83.101900 83.100858 83.098917 83.097544 83.097118 83.097496 83.098206 83.098301 83.097449 )
lat_bot5=( 54.843744 54.844588 54.845924 54.847696 54.848977 54.850340 54.851594 54.852902 54.853911 54.854810 54.856336 54.857018 54.857563 54.856854 54.856691 54.856118 54.855819 54.854619 54.853256 54.851594 54.851267 54.851730 54.852357 54.851648 54.850994 54.849549 54.849059 54.847941 54.846796 54.845515 54.844888 54.844915 54.845187 54.846496 54.847368 54.846905 54.846251 54.845215 54.844260 54.843579 )

lon_bot6=( 83.109006 83.108196 83.105838 83.104807 83.101565 83.101123 83.098962 83.098225 83.096015 83.095180 83.093657 83.093019 83.092773 83.095229 83.097292 83.100141 83.102204 83.104070 83.104610 83.103873 83.101712 83.099650 83.096801 83.094640 83.091938 83.092282 83.095229 83.098864 83.101761 83.100632 83.096899 83.093412 83.089040 83.087960 83.086437 83.086585 83.088451 83.091054 83.093412 83.097145 )
lat_bot6=( 54.837220 54.838714 54.837384 54.837017 54.835885 54.835942 54.837158 54.837328 54.838742 54.839817 54.840722 54.841825 54.843182 54.843833 54.843352 54.843861 54.843861 54.844851 54.845615 54.846661 54.847113 54.847311 54.847509 54.847792 54.848273 54.849970 54.850224 54.850592 54.849998 54.849008 54.847736 54.846859 54.845049 54.843578 54.841401 54.839845 54.838488 54.837554 54.837384 54.837696 )

lon_bot7=( 83.071584 83.075232 83.078407 83.080467 83.084373 83.087677 83.090810 83.091196 83.091368 83.092398 83.089608 83.087033 83.088836 83.091754 83.095831 83.098706 83.101281 83.103513 83.103127 83.101710 83.099779 83.097161 83.097633 83.100166 83.101925 83.101024 83.099093 83.096604 83.093127 83.092827 83.095016 83.095273 83.092226 83.089952 83.086604 83.083815 83.082613 83.081240 83.080982 83.079352 )
lat_bot7=( 54.846215 54.846487 54.846759 54.847129 54.847722 54.848735 54.849699 54.849155 54.846857 54.845573 54.843200 54.841643 54.840828 54.840062 54.839049 54.838060 54.836552 54.834031 54.833166 54.831238 54.831461 54.832449 54.834377 54.835218 54.834526 54.833735 54.834476 54.834995 54.835935 54.837566 54.841520 54.843645 54.844658 54.842237 54.839049 54.838604 54.841940 54.843447 54.844609 54.846363 )

i=0

curl -X POST  ${server}/auth -H "Content-Type: application/json" -d "{\"uuid\":\"bot1\",\"latitude\":${lat_bot1[$i]},\"longitude\":${lon_bot1[$i]},\"accuracy\":2.0}"
curl -X POST  ${server}/games/bot1 -H "Content-Type: application/json" -d  "{\"uuid\":\"bot1\",\"latitude\":${lat_bot1[$i]},\"longitude\":${lon_bot1[$i]},\"accuracy\":2.0, \"action\":\"subscribe\",\"gamename\":\"demo\"}"

curl -X POST  ${server}/auth -H "Content-Type: application/json" -d "{\"uuid\":\"bot2\",\"latitude\":${lat_bot2[$i]},\"longitude\":${lon_bot2[$i]},\"accuracy\":2.0}"
curl -X POST  ${server}/games/bot1 -H "Content-Type: application/json" -d  "{\"uuid\":\"bot2\",\"latitude\":${lat_bot2[$i]},\"longitude\":${lon_bot2[$i]},\"accuracy\":2.0, \"action\":\"subscribe\",\"gamename\":\"demo\"}"

curl -X POST  ${server}/auth -H "Content-Type: application/json" -d "{\"uuid\":\"bot3\",\"latitude\":${lat_bot3[$i]},\"longitude\":${lon_bot3[$i]},\"accuracy\":2.0}"
curl -X POST  ${server}/games/bot1 -H "Content-Type: application/json" -d  "{\"uuid\":\"bot3\",\"latitude\":${lat_bot1[$i]},\"longitude\":${lon_bot3[$i]},\"accuracy\":2.0, \"action\":\"subscribe\",\"gamename\":\"demo\"}"

curl -X POST  ${server}/auth -H "Content-Type: application/json" -d "{\"uuid\":\"bot4\",\"latitude\":${lat_bot4[$i]},\"longitude\":${lon_bot4[$i]},\"accuracy\":2.0}"
curl -X POST  ${server}/games/bot1 -H "Content-Type: application/json" -d  "{\"uuid\":\"bot4\",\"latitude\":${lat_bot4[$i]},\"longitude\":${lon_bot4[$i]},\"accuracy\":2.0, \"action\":\"subscribe\",\"gamename\":\"demo\"}"

curl -X POST  ${server}/auth -H "Content-Type: application/json" -d "{\"uuid\":\"bot5\",\"latitude\":${lat_bot5[$i]},\"longitude\":${lon_bot5[$i]},\"accuracy\":2.0}"
curl -X POST  ${server}/games/bot1 -H "Content-Type: application/json" -d  "{\"uuid\":\"bot5\",\"latitude\":${lat_bot5[$i]},\"longitude\":${lon_bot5[$i]},\"accuracy\":2.0, \"action\":\"subscribe\",\"gamename\":\"demo\"}"

curl -X POST  ${server}/auth -H "Content-Type: application/json" -d "{\"uuid\":\"bot6\",\"latitude\":${lat_bot6[$i]},\"longitude\":${lon_bot6[$i]},\"accuracy\":2.0}"
curl -X POST  ${server}/games/bot1 -H "Content-Type: application/json" -d  "{\"uuid\":\"bot6\",\"latitude\":${lat_bot6[$i]},\"longitude\":${lon_bot6[$i]},\"accuracy\":2.0, \"action\":\"subscribe\",\"gamename\":\"demo\"}"

curl -X POST  ${server}/auth -H "Content-Type: application/json" -d "{\"uuid\":\"bot7\",\"latitude\":${lat_bot7[$i]},\"longitude\":${lon_bot7[$i]},\"accuracy\":2.0}"
curl -X POST  ${server}/games/bot1 -H "Content-Type: application/json" -d  "{\"uuid\":\"bot7\",\"latitude\":${lat_bot7[$i]},\"longitude\":${lon_bot7[$i]},\"accuracy\":2.0, \"action\":\"subscribe\",\"gamename\":\"demo\"}"

#sleep 1

for i in "${range[@]}"
do
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot1\",\"latitude\":${lat_bot1[$i]},\"longitude\":${lon_bot1[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot2\",\"latitude\":${lat_bot2[$i]},\"longitude\":${lon_bot2[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot3\",\"latitude\":${lat_bot3[$i]},\"longitude\":${lon_bot3[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot4\",\"latitude\":${lat_bot4[$i]},\"longitude\":${lon_bot4[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot5\",\"latitude\":${lat_bot5[$i]},\"longitude\":${lon_bot5[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot6\",\"latitude\":${lat_bot6[$i]},\"longitude\":${lon_bot6[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot7\",\"latitude\":${lat_bot7[$i]},\"longitude\":${lon_bot7[$i]},\"accuracy\":4.0}";
   #sleep 1
done

for i in "${range[@]}"
do
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot1\",\"latitude\":${lat_bot1[$i]},\"longitude\":${lon_bot1[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot2\",\"latitude\":${lat_bot2[$i]},\"longitude\":${lon_bot2[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot3\",\"latitude\":${lat_bot3[$i]},\"longitude\":${lon_bot3[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot4\",\"latitude\":${lat_bot4[$i]},\"longitude\":${lon_bot4[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot5\",\"latitude\":${lat_bot5[$i]},\"longitude\":${lon_bot5[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot6\",\"latitude\":${lat_bot6[$i]},\"longitude\":${lon_bot6[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot7\",\"latitude\":${lat_bot7[$i]},\"longitude\":${lon_bot7[$i]},\"accuracy\":4.0}";
   #sleep 1
done

for i in "${range[@]}"
do
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot1\",\"latitude\":${lat_bot1[$i]},\"longitude\":${lon_bot1[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot2\",\"latitude\":${lat_bot2[$i]},\"longitude\":${lon_bot2[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot3\",\"latitude\":${lat_bot3[$i]},\"longitude\":${lon_bot3[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot4\",\"latitude\":${lat_bot4[$i]},\"longitude\":${lon_bot4[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot5\",\"latitude\":${lat_bot5[$i]},\"longitude\":${lon_bot5[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot6\",\"latitude\":${lat_bot6[$i]},\"longitude\":${lon_bot6[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot7\",\"latitude\":${lat_bot7[$i]},\"longitude\":${lon_bot7[$i]},\"accuracy\":4.0}";
   #sleep 1
done

for i in "${range[@]}"
do
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot1\",\"latitude\":${lat_bot1[$i]},\"longitude\":${lon_bot1[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot2\",\"latitude\":${lat_bot2[$i]},\"longitude\":${lon_bot2[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot3\",\"latitude\":${lat_bot3[$i]},\"longitude\":${lon_bot3[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot4\",\"latitude\":${lat_bot4[$i]},\"longitude\":${lon_bot4[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot5\",\"latitude\":${lat_bot5[$i]},\"longitude\":${lon_bot5[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot6\",\"latitude\":${lat_bot6[$i]},\"longitude\":${lon_bot6[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot7\",\"latitude\":${lat_bot7[$i]},\"longitude\":${lon_bot7[$i]},\"accuracy\":4.0}";
   #sleep 1
done

for i in "${range[@]}"
do
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot1\",\"latitude\":${lat_bot1[$i]},\"longitude\":${lon_bot1[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot2\",\"latitude\":${lat_bot2[$i]},\"longitude\":${lon_bot2[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot3\",\"latitude\":${lat_bot3[$i]},\"longitude\":${lon_bot3[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot4\",\"latitude\":${lat_bot4[$i]},\"longitude\":${lon_bot4[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot5\",\"latitude\":${lat_bot5[$i]},\"longitude\":${lon_bot5[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot6\",\"latitude\":${lat_bot6[$i]},\"longitude\":${lon_bot6[$i]},\"accuracy\":4.0}";
   curl -X POST  ${server}/state -H "Content-Type: application/json" -d "{\"uuid\":\"bot7\",\"latitude\":${lat_bot7[$i]},\"longitude\":${lon_bot7[$i]},\"accuracy\":4.0}";
   #sleep 1
done




