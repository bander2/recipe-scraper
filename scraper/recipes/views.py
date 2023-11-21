from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from recipe_scrapers import scrape_me


def recipe(request):
    url = request.GET.get('url', '')
    if not url:
        return HttpResponse('Please pass a url')

    try:
        scraper = scrape_me(url, wild_mode=True)
    except:
        return HttpResponse('Cannot parse ' + url, status=422)

    return JsonResponse(scraper.to_json())
