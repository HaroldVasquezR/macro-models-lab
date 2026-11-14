function u01_export_figures(r, out_dir)
% U01_EXPORT_FIGURES Exporta dos figuras separadas a PNG y PDF.
% No fija un toolkit: utiliza el disponible en el equipo del estudiante.
% El exportador grafico es parte del entorno instalado, no un paquete .m.
    fig = figure('Visible', 'off');
    clean_fig = onCleanup(@() close(fig)); %#ok<NASGU>
    plot(r.t, r.y_base, '-', r.t, r.y_alt, '--', 'LineWidth', 1.8);
    grid on;
    xlabel('Anios desde el inicio');
    ylabel('Indice de ingreso real por habitante');
    title('Crecimiento compuesto: escenarios ilustrativos');
    legend(sprintf('A: %.2f %% anual', 100*r.params.g_base), ...
           sprintf('B: %.2f %% anual', 100*r.params.g_alt), ...
           'Location', 'northwest');
    save_pair(fig, out_dir, 'growth_paths');
    % Otra figura, no un panel: brecha relativa a A en porcentaje.
    fig2 = figure('Visible', 'off');
    clean_fig2 = onCleanup(@() close(fig2)); %#ok<NASGU>
    plot(r.t, r.gap_pct, '-', 'LineWidth', 1.8);
    grid on;
    xlabel('Anios desde el inicio');
    ylabel('Diferencia relativa a A (%)');
    title('Brecha de niveles: 100 * (B/A - 1)');
    save_pair(fig2, out_dir, 'relative_gap');
end

function save_pair(fig, out_dir, stem)
    set(fig, 'PaperUnits', 'centimeters');
    set(fig, 'PaperPosition', [0 0 16 10]);
    set(fig, 'PaperSize', [16 10]);
    print(fig, fullfile(out_dir, [stem '.png']), '-dpng', '-r160');
    print(fig, fullfile(out_dir, [stem '.pdf']), '-dpdf');
end
