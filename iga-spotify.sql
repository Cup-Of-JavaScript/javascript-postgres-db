/* Exercise 1 - Active Users */

select account_id, user_name from account where is_active = true

/* Exercise 2 - Count Playlist  */

select count(*) from playlist where account_id = 1

/* Exercise 3 - Song Length  */

select song_id, song_name, length from song where length > 150

/* Exercise 4 - Active Playlists   */

select playlist_id, playlist_name from playlist p 
    join account a on p.account_id = a.account_id
    where a.is_active = true
    
/* Exercise 5 Songs for Playlists  */

select s.song_id, 
       ps.playlist_id, 
       s.song_name, 
       p.playlist_name 
from song s 
    join playlist_song ps on s.song_id = ps.song_id 
    join playlist p on ps.playlist_id = p.playlist_id
    join account a on p.account_id = a.account_id     
    where a.account_id = 1
    

