import os
import discord

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
client.remove_command("help")

# templarCommand()

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
  await ctx.send (f'Templar hugs {author_name} ❤')

@client.command()
async def pat(ctx, *, member):
  #author_name = ctx.message.author.name
  author_name = ctx.author.mention
  await ctx.send (f'https://cdn.discordapp.com/emojis/911024348586975304.gif')

client.run(TOKEN)
