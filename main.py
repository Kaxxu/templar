import os
import discord
import random

from discord.ext import commands
from dotenv import load_dotenv

load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')
client = discord.Client()

#######################
# Twitch notification #
#######################

############
# Commands #
############
client = commands.Bot(command_prefix='?')
client.remove_command("rem")

# templarCommand()

@client.command()
async def help(ctx, *, member):
#  author_name = ctx.message.author.name
  await ctx.send (f'Commands to use - command prefix `?`: `Ban; unban; hug; hugme; pat; cool; cursed; hi; bye`')

@client.command()
async def ban(ctx, *, member):
#  author_name = ctx.message.author.name
  await ctx.send (f'{member} has been permanently banned from the channel by Kax.')

@client.command()
async def unban(ctx, *, member):
  await ctx.send (f'{member} has been unbanned from the channel by Kax.')

@client.command()
async def hug(ctx, *, member):
  #author_name = ctx.message.author.name
  author_name = ctx.author.mention
  await ctx.send (f'{author_name} is hugging {member} ❤')

@client.command()
async def hugme(ctx):
  author_name = ctx.author.mention
  await ctx.send (f'Pom hugs {author_name} ❤')

@client.command()
async def pat(ctx, *, member):
  #author_name = ctx.message.author.name
  author_name = ctx.author.mention
  await ctx.send (f'https://cdn.discordapp.com/emojis/911024348586975304.gif')

@client.command()
async def cool(ctx):
  author_name = ctx.author.mention
  value = random.randint(1, 100 - 1)
  await ctx.send (f'{author_name} is {value}% cool!!')

@client.command()
async def cursed(ctx):
  author_name = ctx.author.mention
  value = random.randint(0, 100 - 1)
  await ctx.send (f'The above cursed post is {value}% cursed!!')

@client.command()
async def hi(ctx):
  author_name = ctx.author.mention
  await ctx.send (f'https://tenor.com/view/hello-there-private-from-penguins-of-madagascar-hi-wave-hey-there-gif-16043627')

@client.command()
async def bye(ctx):
  author_name = ctx.author.mention
  await ctx.send (f'https://tenor.com/view/bye-cry-sad-baby-girl-gif-7550145')

@client.command()
async def stupid(ctx, *, member):
  author_name = ctx.author.mention
  await ctx.send (f'NO {author_name}!! You are not stupid, just clumsy!! ❤')

client.run(TOKEN)
