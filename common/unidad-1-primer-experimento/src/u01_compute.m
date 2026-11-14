function r = u01_compute(p)
% U01_COMPUTE Dos escenarios y metricas. p contiene y0,g_base,g_alt,T.
    fields = {'y0', 'g_base', 'g_alt', 'T'};
    if ~(isstruct(p) && isscalar(p))
        error('U01:Parameters', 'p debe ser una estructura escalar.');
    end
    for j = 1:numel(fields)
        if ~isfield(p, fields{j})
            error('U01:Parameters', 'Falta el campo %s.', fields{j});
        end
    end
    [r.t, r.y_base] = growth_path(p.y0, p.g_base, p.T);
    [~, r.y_alt] = growth_path(p.y0, p.g_alt, p.T);
    r.gap_points = r.y_alt - r.y_base;
    r.gap_pct = 100 * (r.y_alt ./ r.y_base - 1);
    r.cum_base_pct = 100 * (r.y_base / double(p.y0) - 1);
    r.cum_alt_pct = 100 * (r.y_alt / double(p.y0) - 1);
    r.rate_gap_pp = 100 * (double(p.g_alt) - double(p.g_base));
    r.matrix = [r.t, r.y_base, r.y_alt, r.gap_points, r.gap_pct, ...
                r.cum_base_pct, r.cum_alt_pct];
    if any(~isfinite(r.matrix(:)))
        error('U01:NumericRange', 'Las metricas exceden el rango numerico.');
    end
    r.params = p;
end
