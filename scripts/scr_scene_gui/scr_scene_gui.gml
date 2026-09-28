function scr_scene_gui() {
    return [
        { nome: "Nich", texto: "O que aconteceu?" },
        { nome: "Gui", texto: "A-aquele cara… E-Ele roubou minha carteira!" },
        {
            nome: "",
            texto: "",
            choices: [
                {
                    texto: "Sinto muito, espero que consiga.",
                    next_lines: [
                        { nome: "Nich", texto: "Sinto muito, espero que consiga encontrá-lo e recuperar suas coisas." }
                    ]
                },
                {
                    texto: "Eu posso ajudar!",
                    resultado: "gui_entrou",
                    next_lines: [
                        { nome: "Nich", texto: "Eu posso ajudar a tentar capturar esse cara." },
                        { nome: "Gui", texto: "S-sério?!" },
                        { nome: "Nich", texto: "Claro!" },
                        { nome: "Gui", texto: "Caramba! Muito obrigado mesmo!" }
                    ]
                }
            ]
        }
    ];
}