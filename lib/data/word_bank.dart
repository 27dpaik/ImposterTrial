class Category {
  final String name;
  final List<String> words;
  const Category(this.name, this.words);
}

const List<Category> wordBank = [
  Category('Food', [
    'Pizza', 'Sushi', 'Hamburger', 'Taco', 'Ramen', 'Pasta', 'Ice Cream',
    'Sandwich', 'Salad', 'Soup', 'Steak', 'Fried Chicken', 'Dumpling',
    'Croissant', 'Bagel', 'Donut', 'Pancake', 'Waffle', 'Omelette', 'Burrito',
    'Nachos', 'Kimchi', 'Biryani', 'Pho', 'Falafel', 'Gyro', 'Lasagna',
    'Risotto', 'Curry', 'Fish and Chips',
  ]),
  Category('Sports', [
    'Soccer', 'Basketball', 'Football', 'Baseball', 'Tennis', 'Golf', 'Hockey',
    'Volleyball', 'Swimming', 'Track', 'Wrestling', 'Lacrosse', 'Rugby',
    'Cricket', 'Badminton', 'Table Tennis', 'Boxing', 'MMA', 'Gymnastics',
    'Skateboarding', 'Surfing', 'Skiing', 'Snowboarding', 'Climbing', 'Archery',
    'Fencing', 'Rowing', 'Cycling', 'Bowling', 'Diving',
  ]),
  Category('Fields of Study', [
    'Biology', 'Chemistry', 'Physics', 'Mathematics', 'Computer Science',
    'Engineering', 'History', 'Philosophy', 'Psychology', 'Sociology',
    'Economics', 'Political Science', 'Literature', 'Linguistics',
    'Anthropology', 'Geology', 'Astronomy', 'Neuroscience', 'Statistics',
    'Accounting', 'Marketing', 'Architecture', 'Law', 'Medicine', 'Nursing',
    'Education', 'Geography', 'Theology', 'Music Theory', 'Art History',
  ]),
  Category('Movies', [
    'Inception', 'Titanic', 'Avatar', 'The Godfather', 'Pulp Fiction',
    'The Dark Knight', 'Forrest Gump', 'Star Wars', 'Jurassic Park',
    'The Matrix', 'Avengers Endgame', 'Spider-Man', 'Toy Story', 'Finding Nemo',
    'The Lion King', 'Frozen', 'Shrek', 'Harry Potter', 'Lord of the Rings',
    'Interstellar', 'Joker', 'Parasite', 'Get Out', 'La La Land', 'Whiplash',
    'Goodfellas', 'Fight Club', 'Shawshank Redemption', 'Gladiator', 'Top Gun',
  ]),
  Category('Animals', [
    'Dog', 'Cat', 'Elephant', 'Lion', 'Tiger', 'Bear', 'Panda', 'Kangaroo',
    'Koala', 'Giraffe', 'Zebra', 'Horse', 'Cow', 'Pig', 'Chicken', 'Duck',
    'Rabbit', 'Deer', 'Wolf', 'Fox', 'Eagle', 'Owl', 'Penguin', 'Dolphin',
    'Whale', 'Shark', 'Octopus', 'Turtle', 'Snake', 'Frog',
  ]),
  Category('Countries', [
    'USA', 'Canada', 'Mexico', 'Brazil', 'Argentina', 'UK', 'France', 'Germany',
    'Italy', 'Spain', 'Russia', 'China', 'Japan', 'South Korea', 'India',
    'Australia', 'Egypt', 'South Africa', 'Nigeria', 'Kenya', 'Saudi Arabia',
    'Turkey', 'Greece', 'Sweden', 'Norway', 'Netherlands', 'Vietnam',
    'Thailand', 'Indonesia', 'Philippines',
  ]),
  Category('Household Items', [
    'Chair', 'Sofa', 'Table', 'Bed', 'Lamp', 'Rug', 'Curtain', 'Mirror',
    'Refrigerator', 'Microwave', 'Oven', 'Toaster', 'Blender', 'Coffee Maker',
    'Vacuum', 'Broom', 'Mop', 'Dishwasher', 'Washing Machine', 'Dryer',
    'Television', 'Remote', 'Pillow', 'Blanket', 'Towel', 'Soap', 'Toothbrush',
    'Fork', 'Plate', 'Kettle',
  ]),
  Category('Anime', [
    'Naruto', 'One Piece', 'Attack on Titan', 'Demon Slayer', 'Jujutsu Kaisen',
    'My Hero Academia', 'Death Note', 'Dragon Ball', 'Bleach',
    'Fullmetal Alchemist', 'Hunter x Hunter', 'Tokyo Ghoul', 'Spy x Family',
    'Chainsaw Man', 'One Punch Man', 'Sword Art Online', 'Cowboy Bebop',
    'Neon Genesis Evangelion', 'Code Geass', 'Mob Psycho 100', 'Haikyuu',
    'Black Clover', 'Fairy Tail', 'Vinland Saga', 'Made in Abyss', 'Re:Zero',
    'Steins;Gate', 'Erased', 'Your Name', 'Spirited Away',
  ]),
  Category('Celebrities', [
    'Taylor Swift', 'Beyoncé', 'Drake', 'Kanye West', 'Rihanna',
    'Ariana Grande', 'Justin Bieber', 'Selena Gomez', 'Tom Cruise',
    'Leonardo DiCaprio', 'Brad Pitt', 'Will Smith', 'Dwayne Johnson',
    'Kim Kardashian', 'Kylie Jenner', 'Zendaya', 'Timothée Chalamet',
    'Tom Holland', 'Robert Downey Jr', 'Scarlett Johansson', 'Margot Robbie',
    'Ryan Reynolds', 'Keanu Reeves', 'Elon Musk', 'Mark Zuckerberg',
    'Oprah Winfrey', 'Ellen DeGeneres', 'LeBron James', 'Cristiano Ronaldo',
    'Lionel Messi',
  ]),
  Category('Fast-food Chains', [
    "McDonald's", 'Burger King', "Wendy's", 'Subway', 'Chick-fil-A',
    'Taco Bell', 'KFC', "Domino's", 'Pizza Hut', "Papa John's", 'Chipotle',
    'Five Guys', 'Shake Shack', 'In-N-Out', 'Whataburger', 'Popeyes', "Arby's",
    'Sonic', 'Dairy Queen', 'Jack in the Box', "Carl's Jr", "Hardee's",
    'Panera', 'Panda Express', "Jersey Mike's", "Jimmy John's", 'Quiznos',
    'Little Caesars', "Raising Cane's", "Culver's",
  ]),
  Category('Pop Culture', [
    'TikTok', 'Instagram', 'YouTube', 'Twitch', 'Netflix', 'Spotify',
    'Snapchat', 'Twitter', 'Discord', 'Roblox', 'Minecraft', 'Fortnite',
    'Among Us', 'Genshin Impact', 'Marvel', 'DC Comics', 'Disney', 'Pixar',
    'K-pop', 'BTS', 'Stranger Things', 'The Office', 'Friends',
    'Game of Thrones', 'Squid Game', 'Wednesday', 'Barbie', 'Oppenheimer',
    'MrBeast', 'Met Gala',
  ]),
  Category('BCA', [
  ]),
];
