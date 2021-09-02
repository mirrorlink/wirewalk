const metaFetcher = require('meta-fetcher');
const jsonfile = require('jsonfile');
const download = require('image-downloader')

async function main() 
{
    let websiteList = [
        { name: 'gamestimes', url: 'https://gametimes.com.br/wirewalk%E2%86%B3-e-um-jogo-100-nacional-e-sera-lancado-no-dia-23-de-setembro-na-steam/', lang: 'br' },
        { name: 'fivemgsite', url: 'https://www.5mgsite.com/post/wirewalk-a-futuristic-themed-zelda-game-where-you-have-to-face-a-computer-virus', lang: 'us' },
        { name: 'subarashow', url: 'https://www.subarashow.com.br/podcast/subarashow-32-wirewalk-e-a-dificuldade-pra-criacao-de-jogos-indies-com-danilo-ganzella', lang: 'br' },
        { name: 'gamerview', url: 'https://www.gamerview.com.br/noticias/conheca-o-indie-brasileiro-futurista-wirewalk%E2%86%B3-que-chega-em-breve', lang: 'br' },
        { name: 'kopodo', url: 'http://kopodo.com/2021/aman-lo-retro-entonces-no-se-pierdan-el-video-de-wirewalk%E2%86%B3-una-aventura-indie-para-steam', lang: 'es' },
        { name: 'ultimaficha', url: 'https://www.ultimaficha.com.br/2021/05/25/wirewalk-conheca-o-jogo-o-mais-novo-indie-100-br/', lang: 'br' },
    ];

    let resultList = {
        'list' : []
    };

    for(let i = 0; i < websiteList.length; i++)
    {
        console.log('downloading', websiteList[i].url);
        let result = await metaFetcher(websiteList[i].url );
        result.lang = websiteList[i].lang;
        result.name = websiteList[i].name;
        resultList['list'].push(result)
    }

    for(let i = 0; i < resultList['list'].length; i++)
    {
        let banner = resultList['list'][i]['metadata']['banner'];

        console.log('downloading banner', banner);

        await download.image({
            url: banner,
            dest: '../flutterproject/assets/websitebanners/' + resultList['list'][i].name + '.img'
        });
    }

    jsonfile.writeFileSync('../flutterproject/assets/websites.json', resultList, { spaces: 4 });
}

main();