var tour = {
    id: "tour-hopscotch",
    steps: [
        {
            title: "Título",
            content: "Olá aprenda a .... Texto de ajuda. Texto de ajuda. Texto de ajuda. Texto de ajuda.",
            target: "first-tip",
            placement: "right",
            width: "210px"
        },
        {
            title: "Título",
            content: "Texto de ajuda. Texto de ajuda.",
            target: "top_menu_manage",
            placement: "bottom",
            width: "210px"
        },
        {
            title: "Título",
            content: "Texto de ajuda. Texto de ajuda.",
            target: "tips-tips",
            placement: "top",
            width: "210px"
        },
        {
            title: "Título",
            content: "Texto de ajuda. Texto de ajuda.",
            target: "tips-msg",
            placement: "top",
            width: "210px"
        }
    ],
    i18n: {
        nextBtn: "Próximo",
        prevBtn: "Anterior",
        doneBtn: "Ok",
        skipBtn: "Pular",
        closeTooltip: "Fechar",
    },
    bubblePadding: 10
};

hopscotch.startTour(tour);