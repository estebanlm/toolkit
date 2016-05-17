I'm an abstract class to define a platform to display GUI elementes. 
The idea is to have an strategy with posibilities, so  an user can use OSWindows or the World (or whatever) alternativelly , without polluting applications with ifs.

My children implement platform specific "open" methods. 

Default is World (see #useWorld method).