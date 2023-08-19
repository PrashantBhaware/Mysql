-- select * from campusx.smartphones;
SELECT model, 
sqrt(resolution_width*resolution_width+resolution_height*resolution_height) / screen_size AS 'ppi'
 FROM campusx.smartphones;
 
 SELECT model, rating/10 FROM 	campusx.smartphones;
 
 -- adding constant column in to
 SELECT model, 'smartphone' AS 'type' FROM campusx.smartphones