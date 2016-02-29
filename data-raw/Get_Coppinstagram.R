# getting the pictures from Copper's instagram

# instagram authentication
my_oauth <- instaR::instaOAuth(app_id="e9dc6d3b1bb24f7ea88e335e5b911b68", app_secret="202c2e1728804c348837665f599998d1", scope = "public_content")
save(my_oauth, file = "data-raw/my_oauth")

# load my oauth again
load("data-raw/my_oauth")

CopperPics <- instaR::getUserMedia(username = "coppercar_thesausage", token = my_oauth, n = 48, folder = 'data')

