const metaFetcher = require('meta-fetcher');
const jsonfile = require('jsonfile');

async function main() 
{
    let websiteList = [
        { url: 'https://www.gamerview.com.br/noticias/conheca-o-indie-brasileiro-futurista-wirewalk%E2%86%B3-que-chega-em-breve', lang: 'br' },
        { url: 'https://www.ultimaficha.com.br/2021/05/25/wirewalk-conheca-o-jogo-o-mais-novo-indie-100-br/', lang: 'br' },
        { url: 'https://www.subarashow.com.br/podcast/subarashow-32-wirewalk-e-a-dificuldade-pra-criacao-de-jogos-indies-com-danilo-ganzella', lang: 'br' },
        { url: 'https://www.5mgsite.com/post/wirewalk-a-futuristic-themed-zelda-game-where-you-have-to-face-a-computer-virus', lang: 'us' },
        { url: 'http://kopodo.com/2021/aman-lo-retro-entonces-no-se-pierdan-el-video-de-wirewalk%E2%86%B3-una-aventura-indie-para-steam', lang: 'es' }
    ];

    let resultList = {
        'list' : []
    };

    for(let i = 0; i < websiteList.length; i++)
    {
        console.log('downloading', websiteList[i].url);
        let result = await metaFetcher(websiteList[i].url );
        result.lang = websiteList[i].lang;
        resultList['list'].push(result)
    }

    jsonfile.writeFileSync('../docs/assets/assets/websites.json', resultList, { spaces: 4 });
    jsonfile.writeFileSync('../flutterproject/assets/websites.json', resultList, { spaces: 4 });
}

main();